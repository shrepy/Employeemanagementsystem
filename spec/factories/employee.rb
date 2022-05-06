# frozen_string_literal: true


FactoryBot.define do
  factory :employee do
    name { Faker::Name.name  }
    father_name { 'polo' }
    mother_name { 'kdgb' }
    date_of_birth { "14-04-2022" }
    phone_number { '6268729054' }
    address { 'ehugtue' }
    trainer_id { 1 }
    designation_id { }
    role_id { }
    email {  Faker::Internet.email }
    image { '' }
    password { '123456' }
    account_number { '186428659835'}
    pan_card_number {'9834764937697'}
    aadhar_card_number {'397349679367'}

  end
end
