FactoryBot.define do
  factory :group do
    leader {Faker::Movies::StarWars.character}
  end
end
