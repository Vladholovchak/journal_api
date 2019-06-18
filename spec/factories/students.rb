FactoryBot.define do
  factory :student do
    name {Faker::Movies::StarWars.character}
  end
end
