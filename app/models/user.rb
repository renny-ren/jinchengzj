class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  class << self
    def overview
      { nickname: nickname, id: id, reg_date: created_at.to_date, topics: topics, replies: repiles,
        following: following, follower: follower, signature: signature }
    end
  end

  protected

  def email_required?
    false
  end
end
