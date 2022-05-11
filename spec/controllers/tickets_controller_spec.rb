# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  let!(:designation) { FactoryBot.create(:designation) }
  let!(:role) { FactoryBot.create(:role) }
  let!(:employee) { FactoryBot.create(:employee, role_id: role.id, designation_id: designation.id) }
  let!(:ticket) do
    FactoryBot.create(:ticket, employee_id: employee.id)
  end
  before do
    sign_in(employee)
  end

  describe '#index' do
    it 'show all ticket ' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe '#create' do
    it 'apply for ticket' do
      post :create, params: { ticket: { employee_id: employee.id, description: 'xyz' } }
      expect(response.status).to eq(302)
    end
  end

  describe '#update' do
    it 'hr can accept ticket' do
      patch :update, params: { id: ticket.id }
      expect(response.status).to eq(302)
    end
  end

  describe '#decline_ticket' do
    it 'hr can decline ticket' do
      patch :decline_ticket, params: { id: ticket.id }
      expect(response.status).to eq(302)
    end
  end
end
