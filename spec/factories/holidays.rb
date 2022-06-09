# frozen_string_literal: true

FactoryBot.define do
  factory :holiday do
    holiday_name { 'MyString' }
    holiday_date { '2022-03-24' }
    holiday_type { 1 }
  end
end
