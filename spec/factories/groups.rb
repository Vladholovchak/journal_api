FactoryBot.define do
  factory :group do
    group_name {Faker::Movies::StarWars.droid}
    start_stud_date{Faker::Date.between(1.year.ago, 1.year.from_now)}
    leader {Faker::Movies::StarWars.character}
  end
end
