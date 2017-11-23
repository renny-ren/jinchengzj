module PraisesHelper
  def praised?(target)
    return false if current_user.blank?
    current_user.find_action(:praise, target: target).present?
  end
end