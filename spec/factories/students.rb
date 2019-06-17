FactoryBot.define do
  factory :student do
    name {Faker::StarWars.character}
  end
end
