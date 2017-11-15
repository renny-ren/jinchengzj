module ApplicationHelper
  # def is_admin?(user = nil)
  #   user ||= current_user
  #   user.type == 'admin'
  # end

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

  def unread_notification_count
    return 0 if current_user.blank?
    Notification.unread_count(current_user)
  end

  def current_url(new_params)
    request.query_parameters.merge(new_params)
  end
end
