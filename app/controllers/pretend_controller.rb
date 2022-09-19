class PretendController < ApplicationController
  def create
    render_403 unless can_pretend?

    unless pretending?
      remember_current_user
      user = User.find(params[:id])

      logger.info "#{ User.current } is prending as #{user}"
      set_user(user)
    end

    redirect_to user_path(user)
  end

  def delete
    if pretending?
      logger.info "#{ session[:real_user_id] } has stoped pretening"
      set_user(real_user)
      reset_pretent_storage
    end
    redirect_to :back
  end

  private

  def set_user(user)
    User.current = user
    start_user_session(user)
  end

  def can_pretend?
    User.current.logged? && User.current.admin?
  end

  def remember_current_user
    session[:real_user_id] = User.current.id
  end

  def reset_pretent_storage
    @real_user = nil
    session[:real_user_id] = nil
  end
end
