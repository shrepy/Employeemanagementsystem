# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::PerformancesController, type: :controller do
  let(:role) { FactoryBot.create(:role) }
  let(:designation) { FactoryBot.create(:designation) }
  let(:employee) { FactoryBot.create(:employee, designation_id: designation.id, role_id: role.id) }
  let(:performance) { FactoryBot.create(:performance, employee_id: employee.id) }

  before do
    sign_in(employee)
  end

  describe '#index' do
    it 'show all performance ' do
      get :index
      expect(response.status).to eq(200)
    end
  end
end
