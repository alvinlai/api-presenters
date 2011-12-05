FactoryGirl.define do

  factory :todo_list do
    sequence(:name) { |n| "List #{n}" }
  end

  factory :todo_item do
    name { Faker::Company.bs }
    description { Faker::Lorem.paragraph(rand 5) }
    priority 0
  end

end