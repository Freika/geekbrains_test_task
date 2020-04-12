FactoryBot.define do
  factory :group do
    starts_on { Time.current + 1.day }
    course
  end
end
