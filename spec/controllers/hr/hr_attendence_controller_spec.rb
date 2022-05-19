# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Hr::AttendencesController, type: :controller do
  fixtures :all

  let!(:designation) { FactoryBot.create(:designation) }
  let!(:employee) { FactoryBot.create(:employee, role_id: roles(:role_one).id, designation_id: designation.id) }
  let!(:attendence) { FactoryBot.create(:attendence, employee_id: employee.id) }
  let!(:employee_one) { FactoryBot.create(:employee, role_id: roles(:role_two).id, designation_id: designation.id) }

  describe 'Hr can see attendences' do
    before do
      sign_in(employee)
    end

    it 'Hr can see all employee attendences' do
      get :show_attendence, params: { id: employee.id }
      expect(response.status).to eq(200)
    end
  end

  describe 'Employee can see attendences' do
    before do
      sign_in(employee_one)
    end

    it 'Employee can not see all employee attendences' do
      get :show_attendence, params: { id: employee.id }
      expect(response.status).to eq(302)
    end
  end
end
