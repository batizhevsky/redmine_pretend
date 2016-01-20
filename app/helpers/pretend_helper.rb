module PretendHelper
  def can_user_pretend_to?(user)
    !session[:real_user_id] && User.current.admin? && User.current != user
  end

  def current_unpretended_user
    User.find_by_id(session[:real_user_id])
  end
end
