#TODO gem faker
FactoryGirl.define do
  factory :event do
    title Faker::Name.name
    tickets_amount Faker::Number.number(6)
    #{rand 20}
    date_start DateTime.current.at_beginning_of_day
    date_end Faker::Date.forward(10)
  end
end
