FactoryBot.define do
  factory :schedule do
    operational_time {"09:00"}
    day {"Monday"}
    hospital { build(:hospital, name: "Siloam") }
    doctor { build(:doctor, name: "Lalalon") }
end
