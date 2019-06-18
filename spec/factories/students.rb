FactoryBot.define do
  factory :student do
    name {Faker::Movies::StarWars.character}
    surname {Faker::Movies::StarWars.droid}
    father_name {Faker::Movies::StarWars.character}
    date_of_birth {Faker::Date.between(2.year.ago, 1.year.ago)}
  end
end
