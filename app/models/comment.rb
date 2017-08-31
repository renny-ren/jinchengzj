class Comment < ApplicationRecord
  belongs_to :reply, counter_cache: true
  belongs_to :user, counter_cache: true

  self.per_page = 5
end
