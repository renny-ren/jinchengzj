class Node < ApplicationRecord
  include TailorAdmin::NodeAdmin
  has_many :topics
end
