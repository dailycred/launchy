FactoryGirl.define do
  sequence :display do |n|
    "awesome_display_#{n}"
  end

  factory :user do
    display
    sequence :id
  end
end