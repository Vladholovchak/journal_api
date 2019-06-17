FactoryBot.define do
  factory :group do
    group_name {Faker::Movies::StarWars.droid}
    leader {Faker::Movies::StarWars.character}
  end
end
