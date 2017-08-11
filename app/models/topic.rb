class Topic < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :node, counter_cache: true
  has_many :replies, dependent: :destroy

  # counter :view_times, default: 0
end
