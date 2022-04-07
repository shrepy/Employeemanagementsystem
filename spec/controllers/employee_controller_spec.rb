# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EmployeesController, type: :controller do
  # context '#index' do
  let!(:employee) { FactoryBot.create(:employee) }
  describe 'index' do
    before do
      sign_in(employee)
      get :index
    end

    it 'Get Employee' do
      get :index
      expect(response.status).to eq(200)
    end

    it 'Show Employee' do
      get :show, params: { id: employee.id }
      expect(assigns(:employee)).to eq(employee)
    end

    it 'When employee not exist' do
      get :show, params: { id: employee.id + 1 }
      expect(response.status).to eq(404)
    end
  end
end
