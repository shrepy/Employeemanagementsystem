# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EmployeesController, type: :controller do
  fixtures :all

  let!(:designation) { FactoryBot.create(:designation) }
  let!(:role) { FactoryBot.create(:role) }
  let!(:employee) { FactoryBot.create(:employee, role_id: roles(:role_one).id, designation_id: designation.id) }
  let!(:employee_one) { FactoryBot.create(:employee, role_id: roles(:role_one).id, designation_id: designation.id) }
  before do
    sign_in(employee)
  end

  describe '#index' do
    before do
      sign_in(employee)
    end
    it 'Get Employee' do
      get :index
      expect(assigns(:employees).count).to eq(2)
    end
  end

  describe '#show' do
    it 'Show Employee' do
      get :show, params: { id: employee.id }
      expect(assigns(:employee)).to eq(employee)
    end

    it 'return nil when employee not exist' do
      get :show, params: { id: '' }
      expect(assigns(:employee)).to eq(nil)
    end
  end

  describe '#edit' do
    it 'response successfully when employee data is exist' do
      get :edit, params: { id: employee.id }
      expect(response.status).to eq(200)
    end

    it 'return nil when employee not exist' do
      get :edit, params: { id: '' }
      expect(assigns(:employee)).to eq(nil)
    end
  end

  describe '#update' do
    it 'response successfully when employee data is updated' do
      patch :update, params: { employee: { name: 'xyz' }, id: employee.id }
      expect(assigns(:employee)).to eq(employee)
    end

    it 'return nil when employee not exist' do
      patch :update, params: { employee: { name: 'Xyz' }, id: '' }
      expect(assigns(:employee)).to eq(nil)
    end
  end
end
