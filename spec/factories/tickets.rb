FactoryBot.define do
  factory :ticket do
    status { "Accept" }
    description { "MyText" }
    ticket_type { "employee" }
    employee_id { 2 }
  end
end
