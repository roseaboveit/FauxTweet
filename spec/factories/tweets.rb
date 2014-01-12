# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tweet do
    message "Tweet Message"
    author "Guest"
  end
end
