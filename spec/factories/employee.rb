# frozen_string_literal: true


FactoryBot.define do
  factory :employee do
    name { Faker::Name.name  }
    father_name { 'polo' }
    mother_name { 'kdgb' }
    age { 22 }
    phone_number { '27563926' }
    address { 'ehugtue' }
    trainer_id { 1 }
    destination { 'irhgfedgvb' }
    email {  Faker::Internet.email }
    image { '' }
    password { '123456' }
  end
end
