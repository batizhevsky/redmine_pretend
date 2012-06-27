module PretendPatches
 module AdminControllerPatch
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
    def pretend
      session[:real_user_id] = User.current.id
      user = User.find(params[:id])
      logger.info "#{User.current} is pretend as#{user}"
      User.current = user
      session[:user_id] = user.id
      redirect_to :back
    end

  end
 end
end
