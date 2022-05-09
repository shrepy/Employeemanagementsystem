# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LeafsController, type: :controller do
  describe '#index' do
    designation = FactoryBot.create(:designation)
    role = FactoryBot.create(:role, name: 'Employee')
    let(:employee) do
      create :employee, designation_id: designation.id, role_id: role.id, account_number: '8645396793',
                        pan_card_number: '846353986798', aadhar_card_number: '328746328653867',
                        phone_number: '4545454545'
    end
    before do
      sign_in(employee)
    end
    let!(:leaf) { create :leaf, employee_id: employee.id, from_date: Time.now, till_date: Time.now }

    it 'show all leave' do
      get :index
      expect(response.status).to eq(200)
    end

    it 'Employee apply for leave' do
      post :create,
           params: { leaf: { employee_id: employee.id, from_date: Time.now, till_date: Time.now,
                             resion: 'i am going to home' } }
      expect(response.status).to eq(302)
    end
  end
end
