# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Hr::AttendencesController, type: :controller do
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

  describe 'show_attendence' do 
      let!(:designation) { FactoryBot.create(:designation)}
      let!(:role) { FactoryBot.create(:role, name: 'Employee')}
      let!(:employee) { FactoryBot.create(:employee, designation_id: designation.id, role_id: role.id)}
      
      before do
        sign_in(employee)
      end

      it 'Hr can show all employee attendence' do 
        attendence = FactoryBot.create(:attendence, employee_id: employee.id)
        get :show_attendence, params: { id: attendence.id, employee_id: employee.id }
        expect(response.status).to eq(200)
      end
  end
end
