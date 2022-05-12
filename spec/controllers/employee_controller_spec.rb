# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EmployeesController, type: :controller do
    let!(:designation) { FactoryBot.create(:designation) }
    let!(:role) { FactoryBot.create(:role )}
    let!(:employee) { FactoryBot.create(:employee, role_id:  role.id, designation_id: designation.id) }
    before do
      sign_in(employee)
    end

    describe '#index' do
      it 'Get Employee' do
        get :index
        expect(response.status).to eq(200)
      end

      it 'Show Employee' do
        get :show, params: { id: employee.id }
        expect(assigns(:employee)).to eq(employee)
      end

      it 'When employee not exist' do
        get :show, params: { id: '' }
        expect(response.status).to eq(404)
      end
    end

    describe '#edit' do 

      it 'hr can edit employee data' do 
        patch :edit, params: {id: employee.id, name: "xyz"}, xhr: true
        expect(response.status).to eq(200)
      end
    end
end
