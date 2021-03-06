module UsersHelper
  include LetterAvatar::AvatarHelper

  def user_avatar_tag(user, size)
    if user.avatar_file_name.present?
      image_tag user.avatar.url(:thumb), size: "#{size}x#{size}"
    else
      image_tag letter_avatar_url(user.username, 100), size: "#{size}x#{size}"
    end
  end

  def followed?(user)
    return false if current_user.blank?
    current_user.find_action(:follow, target: user).present?
  end
end
