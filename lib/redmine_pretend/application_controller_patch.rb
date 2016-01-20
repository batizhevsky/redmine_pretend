require_dependency 'application_controller'

module PretendPatches
  module ApplicationControllerPatch
    def self.included(base)
      base.extend(ClassMethods)
      base.send(:include, InstanceMethods)

      base.class_eval do
        unloadable # Send unloadable so it will not be unloaded in development
      end
    end

    module ClassMethods
    end

    module InstanceMethods
      def pretend_to
        render_403 unless can_pretend?

        if not_pretended?
          remember_current_user
          user = User.find(params[:id])

          logger.info "#{ User.current } is pretend as #{user}"
          set_user(user)
        end

        redirect_to :back
      end

      def unpretend
        if real_user
          logger.info "#{ session[:real_user_id] } stop pretend"
          set_user(real_user)
          reset_pretent_storage
        end
        redirect_to :back
      end

      def real_user
        @real_user ||= User.find_by_id(User.active.find(session[:real_user_id]))
      end

      private

      def set_user(user)
        User.current = user
        start_user_session(user)
      end

      def not_pretended?
        !session[:real_user_id]
      end

      def can_pretend?
        User.current.logged? && User.current.admin?
      end

      def remember_current_user
        session[:real_user_id] = User.current.id
      end

      def reset_pretent_storage
        session[:real_user_id] = nil
      end
    end
  end
end

unless ApplicationController.included_modules.include?(PretendPatches::ApplicationControllerPatch)
  ApplicationController.send(:include, PretendPatches::ApplicationControllerPatch)
end
