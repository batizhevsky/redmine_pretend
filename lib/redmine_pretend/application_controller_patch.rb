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
      if User.current.logged? && User.current.admin?
        if !session[:real_user_id]
          session[:real_user_id] = User.current.id
          user = User.find(params[:id])
          logger.info "#{User.current} is pretend as #{user}"
          User.current = user
          session[:user_id] = user.id
        end
        redirect_to :back
      else
        render_403
      end
    end

    def unpretend
      if real_user
        logger.info "#{session[:real_user_id]} stop pretend"
        self.logged_user = real_user
        session[:real_user_id] = nil
      end
      redirect_to :back
    end

    def real_user
      @real_user ||= User.find_by_id(User.active.find(session[:real_user_id]))
    end
  end
 end
end

unless ApplicationController.included_modules.include?(PretendPatches::ApplicationControllerPatch)
  ApplicationController.send(:include, PretendPatches::ApplicationControllerPatch)
end
