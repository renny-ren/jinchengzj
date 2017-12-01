require 'faker'

FactoryGirl.define do
  factory :topic do
    title { Faker::Book.title }
    body { Faker::Movie.quote }
    node_id 1
    user_id 1
  end
end
