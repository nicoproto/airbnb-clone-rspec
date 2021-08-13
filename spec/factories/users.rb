FactoryBot.define do
  factory :user do
    email { "nico@gmail.com" }
    password { "password" }
    first_name { "Nicolas" }
    last_name { "Proto" }
  end
end