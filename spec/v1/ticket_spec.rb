# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::TicketsController, type: :controller do
  let(:role) { FactoryBot.create(:role) }
  let(:designation) { FactoryBot.create(:designation) }
  let(:employee) { FactoryBot.create(:employee, designation_id: designation.id, role_id: role.id) }
  let(:ticket) { FactoryBot.create(:ticket, employee_id: employee.id) }

  before do
    sign_in(employee)
  end

  describe '#index' do
    it 'show all Tickets ' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe '#create' do
    it 'create a Ticket' do
      post :create, params: { ticket: { employee_id: employee.id } }
      expect(response.status).to eq(200)
    end
  end

  describe '#update' do
    it 'render to update' do
      patch :update,
            params: { ticket: { status: 'accept', employee_id: employee.id }, id: ticket.id }
      assert_response(200)
    end
  end
end
