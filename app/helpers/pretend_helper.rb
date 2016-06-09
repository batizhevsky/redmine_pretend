module PretendHelper
  def can_user_pretend_to?(user)
    return false unless user.try(:id)
    not_pretending? && User.current.admin? && User.current != user
  end

  private

  def not_pretending?
    !session[:real_user_id].present?
  end
end
