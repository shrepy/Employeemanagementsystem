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
      designation = FactoryBot.create(:designation)
      role =  FactoryBot.create(:role, name: 'HR')
      employee = FactoryBot.create(:employee, designation_id: designation.id, role_id: role.id)
      before do
        sign_in(employee)
      end

      it 'Hr can show all employee attendence' do 
        attendence = FactoryBot.create(:attendence, employee_id: employee.id)
        get :show_attendence, params: { id: employee.id }
        expect(response.status).to eq(200)
      end
  end


  describe 'show_attendence' do 
      designation_one = FactoryBot.create(:designation)
      role_one =  FactoryBot.create(:role, name: 'Employee')
      employee_one= FactoryBot.create(:employee, designation_id: designation_one.id, role_id: role_one.id)
      before do
        sign_in(employee_one)
      end

      it 'Employee can not show all employee attendence' do 
        attendence = FactoryBot.create(:attendence, employee_id: employee_one.id)
        get :show_attendence, params: { id: employee_one.id }
        expect(response.status).to eq(302)
      end
  end
end
