FactoryBot.define do
  factory :user do
    name { "test_user" }
    policy { "test_policy" }
    email { "test@example.com" }
    password { "password" }
  end
end
