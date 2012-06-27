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
    def real_user
      @real_user ||= User.find_by_id(User.active.find(session[:real_user_id]))
    end
    def stop_pretend
      if real_user
        logger.info "#{session[:real_user_id]} stop prtend"
        self.logged_user = real_user
        session[:real_user_id] = nil
      end
      redirect_to(home_url)
    end

  end
 end
end
