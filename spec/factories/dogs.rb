FactoryBot.define do
  factory :dog do
    name { "Tobby" }
    location { "Carrer de Sant Pau 100" }
    price { 250 }
    description { "It's a good boy." }
    user { build(:user) }
  end
end