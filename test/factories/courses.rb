FactoryBot.define do
  factory :course do
    title { FFaker::Book.title }
  end
end
