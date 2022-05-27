# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::TicketsController, type: :controller do
  let(:role) { FactoryBot.create(:role) }
  let(:designation) { FactoryBot.create(:designation) }
  let(:employee) { FactoryBot.create(:employee, designation_id: designation.id, role_id: role.id) }
  let!(:ticket) { FactoryBot.create(:ticket, employee_id: employee.id) }

  before do
    sign_in(employee)
  end

  describe '#index' do
    it 'show all ticket ' do
      get :index, params: { format: :json }
      response_body = JSON.parse(response.body)
      expect(response_body['data'][0]['id']).to eq(ticket.id)
    end
  end

  let(:valid_ticket) { attributes_for(:ticket, employee_id: employee.id) }

  describe '#create' do
    it 'renders a successful response when ticket created' do
      post :create, params: { ticket: valid_ticket }
      expect(Ticket.count).to eq(2)
      response_body = JSON.parse(response.body)
      expect(response_body['message']).to eq(['Successfully ticket create '])
      expect(response.status).to eq(200)
    end
  end

  describe '#update' do
    it 'renders a successful response when ticket status update' do
      patch :update,
            params: { ticket: { status: 'accept', employee_id: employee.id }, id: ticket.id }
      response_body = JSON.parse(response.body).deep_symbolize_keys
      expect(response_body[:data][:status]).to eq('accept')
      expect(response.status).to eq(200)
    end
  end
end
