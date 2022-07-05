# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AdminMain::TicketsController, type: :controller do
  fixtures :roles

  let!(:designation) { FactoryBot.create(:designation) }
  let!(:employee) { FactoryBot.create(:employee, role_id: roles(:role_three).id, designation_id: designation.id) }
  let!(:ticket) { FactoryBot.create(:ticket, employee_id: employee.id) }
  before do
    sign_in(employee)
  end

  describe 'index' do
    it 'search ticket by employee name' do
      get :index, params: { ticket: employee.name }
      expect(assigns(:tickets)).to eq([ticket])
    end
  end

  describe 'Get #show' do
    it 'show ticket' do
      get :show, params: { id: ticket.id }
      expect(response.status).to eq(200)
    end
    it 'return nil when ticket not exist' do
      get :show, params: { id: '' }
      expect(assigns(:ticket)).to eq(nil)
    end
  end

  describe 'PATCH #update' do
    it 'update a ticket status Accept' do
      patch :update, params: { ticket: { status: 'Accept' }, id: ticket.id }
      expect(response.status).to eq(302)
    end
    it 'update a ticket status Decline' do
      patch :update, params: { ticket: { status: 'Decline' }, id: ticket.id }
      expect(response.status).to eq(302)
    end
  end
end
