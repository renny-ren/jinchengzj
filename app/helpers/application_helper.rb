module ApplicationHelper
  def is_admin?(user = nil)
    user ||= current_user
    user.try(:admin?)
  end

  def is_owner?(user)
    return false if user.blank? || current_user.blank?
    user.id == current_user.id
  end

  def highlight(text)
    text = escape_once(text)
    text.gsub!("[h]", "<em>")
    text.gsub!("[/h]", "</em>")
    text.gsub!(/\\n|\\r/, "")
    raw text
  end
end
