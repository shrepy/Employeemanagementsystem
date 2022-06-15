FactoryBot.define do
  factory :comment do
    commenter { "MyString" }
    ticket { nil }
  end
end
