# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::EmployeesController, type: :controller do
  let(:role) { FactoryBot.create(:role) }
  let(:designation) { FactoryBot.create(:designation) }
  let(:employee) { FactoryBot.create(:employee, designation_id: designation.id, role_id: role.id) }

  before do
    sign_in(employee)
  end

  describe 'GET# employees#show' do
    before do
      get :show, params: { id: employee.id }
    end

    it 'show the employee details' do
      response_body = JSON.parse(response.body)
      expect(response.status).to eq(200)
    end
  end

  describe '#update' do
    context '#with valid parameters' do
      it 'renders a successful response when Employee update' do
        patch :update,
              params: {
                employee: { password: 'password123' }, id: employee.id
              }
        response_body = JSON.parse(response.body).deep_symbolize_keys
        expect(response_body[:message]).to eq(["password successfully update"])
        expect(response.status).to eq(200)
      end

      it 'render 404 when employee not exit' do
        patch :update, params: { employee: { password: 'password' }, id: '' }
        response_body = JSON.parse(response.body).deep_symbolize_keys
        expect(response_body[:message]).to eq('Not Found')
        expect(response.status).to eq(404)
      end
    end
  end
end
