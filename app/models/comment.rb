class Comment < ApplicationRecord
  belongs_to :reply
  belongs_to :user

end
