# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AttendencesController, type: :controller do
  # describe 'update' do
  #   it 'checkout' do
  #     employee = FactoryBot.create(:employee)
  #     attendence = FactoryBot.create(:attendence, employee_id: employee.id)
  #     patch :update, params: { id: attendence.id, checkout_time: Time.now }
  #     expect(response.status).to eq(302)
  #   end
  # end

  # describe 'create' do
  #   employee = FactoryBot.create(:employee)
  #   before do
  #     sign_in(employee)
  #   end
  #   it 'checkin' do
  #     post :create, params: { employee_id: employee.id }
  #     expect(response.status).to eq(302)
  #   end
  # end

  describe 'index' do
    let!(:designation) { FactoryBot.create(:designation)}
    let!(:role) { FactoryBot.create(:role )}
    let!(:employee) { FactoryBot.create(:employee, role_id:  role.id, designation_id: designation.id) }
    let!(:attendence) { FactoryBot.create(:attendence, employee_id: employee.id)}
      before do
        sign_in(employee)
        get :index
      end

      it 'Get Employee' do
        get :index
        expect(response.status).to eq(200)
      end
  end
end
