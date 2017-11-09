class Resource < ApplicationRecord
  belongs_to :user
  belongs_to :topic

  default_scope -> { lost }
  scope :lost, -> { where(lost_or_found: 'lost') }
  scope :found, -> { where(lost_or_found: 'found') }
end
