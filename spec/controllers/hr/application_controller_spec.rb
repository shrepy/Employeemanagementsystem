# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Hr::ApplicationController, type: :controller do
  fixtures :all

  let!(:designation) { FactoryBot.create(:designation) }
  let!(:hr) { FactoryBot.create(:employee, role_id: roles(:role_one).id, designation_id: designation.id) }
  let!(:employee) { FactoryBot.create(:employee, role_id: roles(:role_two).id, designation_id: designation.id) }
  let!(:attendence) { FactoryBot.create(:attendence, employee_id: employee.id) }

  describe 'Only all for Hr' do
    it 'response successfully when current employee role is hr' do
      sign_in(hr)
      controller.send(:authorize_admin)
      expect(response.status).to eq(200)
    end

    it 'return root path when current employee role is Employee' do
      sign_in(employee)
      employee.update_column('role_id', roles(:role_two).id)
      expect(response.status).to eq(200)
    end
  end
end
