FactoryBot.define do
  factory :dog do
    name { "Tobby" }
    location { "Carrer de Sant Pau 100" }
    breed { "saint bernard"}
    price { 250 }
    description { "It's a good boy, a really good boy that always takes care of you." }
    user { build(:user) }
  end
end