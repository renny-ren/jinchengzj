class Resource < ApplicationRecord
  belongs_to :user
  belongs_to :topic

  scope :lost, -> { where(lost_or_found: 'lost') }
  scope :found, -> { where(lost_or_found: 'found') }
end
