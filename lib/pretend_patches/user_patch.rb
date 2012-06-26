module PretendPatches
 module UserPatch
  def self.included(base)
    base.extend(ClassMethods)
    base.send(:include, InstanceMethods)
    base.class_eval do
      unloadable # Send unloadable so it will not be unloaded in development
    end
  end

  module ClassMethods
    def pretend?
    end
  end

  module InstanceMethods
    def real_user
      @real_user ||= User.find_by_id(User.active.find(session[:real_user_id]))
    end
  end
 end
end
