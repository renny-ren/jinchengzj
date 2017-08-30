FactoryGirl.define do
  factory :comment do
    body "MyText"
    user_id 1
    reply_id 1
    target_nickname "MyString"
  end
end
