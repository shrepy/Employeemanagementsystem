FactoryBot.define do
  factory :ticket do
    status { "MyString" }
    description { "MyText" }
    ticket_type { 1 }
    employee { nil }
  end
end
