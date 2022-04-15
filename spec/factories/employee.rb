# frozen_string_literal: true


FactoryBot.define do
  factory :employee do
    name { Faker::Name.name  }
    father_name { 'polo' }
    mother_name { 'kdgb' }
    date_of_birth { "14-04-2022" }
    phone_number { '27563926' }
    address { 'ehugtue' }
    trainer_id { 1 }
    designation_id { }
    email {  Faker::Internet.email }
    image { '' }
    password { '123456' }
  end
end
