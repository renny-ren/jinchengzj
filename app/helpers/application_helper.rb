module ApplicationHelper
  def is_admin?(user = nil)
    user ||= current_user
    user.try(:admin?)
  end

  def is_owner?(user)
    return false if user.blank? || current_user.blank?
    user.id == current_user.id
  end
end
