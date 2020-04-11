FactoryBot.define do
  factory :user do
    email { FFaker::Email.email }
    password { SecureRandom.hex(8) }
  end
end
