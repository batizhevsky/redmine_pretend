require_dependency 'application_controller'

module PretendPatches
  module ApplicationControllerPatch
    def self.included(base)
      base.send(:include, InstanceMethods)

      base.class_eval do
        unloadable # Send unloadable so it will not be unloaded in development
        helper PretendHelper
        helper_method :real_user
      end
    end

    module InstanceMethods
      def real_user
        @real_user ||= User.find_by_id(User.active.find(session[:real_user_id]))
      end

      def pretending?
        session[:real_user_id].present?
      end
    end
  end
end

unless ApplicationController.included_modules.include?(PretendPatches::ApplicationControllerPatch)
  ApplicationController.send(:include, PretendPatches::ApplicationControllerPatch)
end
