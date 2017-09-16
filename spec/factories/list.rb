FactoryGirl.define do
  factory :list do
    body { Faker::Lorem.word }
  end
end
