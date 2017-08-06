class User < ApplicationRecord
  attr_accessor :login
  validates :username, presence: true, uniqueness: true, length: 3..16
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, multiline: true # Only allow letter, number, underscore and punctuation.
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_create :send_welcome_mail

  has_attached_file :avatar, styles: { medium: '100x100', small: '55x55', thumb: '45x45' }, default_url: '/images/missing.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def send_welcome_mail
    UserMailer.welcome(id).deliver_later
  end

  class << self
    def overview
      { nickname: nickname, id: id, reg_date: created_at.to_date, topics: topics, replies: repiles,
        following: following, follower: follower, signature: signature }
    end

    def find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      login = conditions.delete(:login)
      where(conditions).where(['lower(username) = :value OR lower(email) = :value', { value: login.strip.downcase }]).first
    end
  end

  # protected

  # def email_required?
  #   false
  # end
end
