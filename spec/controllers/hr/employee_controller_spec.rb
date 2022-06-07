# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Hr::EmployeesController, type: :controller do
  fixtures :all

  let!(:designation) { FactoryBot.create(:designation) }
  let!(:employee) { FactoryBot.create(:employee, role_id: roles(:role_one).id, designation_id: designation.id) }

  before do
    sign_in(employee)
  end

  describe '#index' do
    it 'redirect to new' do
      get :index
      expect(response).to redirect_to(new_hr_employee_path)
    end
  end

  describe '#new' do
    it 'create new employee' do
      get :new
      expect(response.status).to eq(200)
    end
  end

  describe '#create' do
    it 'create new employee' do
      post :create, params: { employee: { name: 'xyz' } }
      expect(response.status).to eq(200)
    end
  end
end
