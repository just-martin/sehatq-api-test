FactoryBot.define do
  factory :user do
    name { "Martin" }
    email { "martin@kiranatama.com" }
    password {"12345678"}
    password_confirmation {"12345678"}
  end
end
