FactoryBot.define do
    factory :film do
      sequence(:title) { |n| "title#{n}" }
      year{ 1995 }
      sequence(:director) { |n| "director#{n}" }
    end
  end