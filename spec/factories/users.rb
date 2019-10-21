FactoryBot.define do
  factory :user do
    name { "adax" }
    email { "adax@gmail.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
