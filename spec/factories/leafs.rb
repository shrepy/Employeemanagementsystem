FactoryBot.define do
  factory :leaf do
    available_balance { 1 }
    leave_type { "MyString" }
    from_date { "2022-03-30" }
    till_date { "2022-03-30" }
    leave_starts { "MyString" }
    leave_end { "MyString" }
    total_days { 1 }
    resion { "MyString" }
    leave_status { false }
    employee { nil }
  end
end
