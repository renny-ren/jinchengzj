class Resource < ApplicationRecord
  belongs_to :user
  belongs_to :topic

  validates :title, :description, presence: true

  scope :lost, -> { where(lost_or_found: 'lost') }
  scope :found, -> { where(lost_or_found: 'found') }

  def self.type_filter(type)
    where(res_type: type)
  end
end
