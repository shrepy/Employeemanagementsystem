FactoryBot.define do
  factory :performance do
    points { 1 }
    month { "MyString" }
    from { "2022-03-24" }
    to { "2022-03-24" }
    employee_id { 1 }
  end
end
