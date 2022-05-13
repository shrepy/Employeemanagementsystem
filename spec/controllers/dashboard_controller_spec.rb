# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  let!(:designation) { FactoryBot.create(:designation) }
  let!(:role) { FactoryBot.create(:role) }
  let!(:employee) do
    FactoryBot.create(:employee, role_id: role.id, designation_id: designation.id, date_of_birth: Time.now.to_date)
  end
  let!(:employee1) do
    FactoryBot.create(:employee, role_id: role.id, designation_id: designation.id, date_of_birth: Time.now.to_date,
                                 joining_date: Time.now.to_date)
  end

  describe 'index' do
    before do
      sign_in(employee)
      # employee1
    end
    it 'To show the details of those employees whose birthday is today ' do
      get :index
      expect(assigns(:employees).count).to eq(2)
    end

    it 'To show the details of those employees whose Recent withing 3 days joined' do
      get :index
      expect(assigns(:recent_join_employees).count).to eq(1)
    end
  end
end
