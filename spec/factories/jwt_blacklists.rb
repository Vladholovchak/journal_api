FactoryBot.define do
  factory :jwt_blacklist do
    jti { "MyString" }
    exp { "2019-07-01 20:41:58" }
  end
end
