# frozen_string_literal: true

FactoryBot.define do
  factory :ticket do
    status { nil }
    description { 'MyText' }
    ticket_type { 'employee' }
    employee { nil }
  end
end
