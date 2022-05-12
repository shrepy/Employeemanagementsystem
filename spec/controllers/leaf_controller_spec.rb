# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LeafsController, type: :controller do
  let!(:designation) { FactoryBot.create(:designation) }
  let!(:role) { FactoryBot.create(:role) }
  let!(:employee) { FactoryBot.create(:employee, role_id: role.id, designation_id: designation.id) }
  let!(:leaf) do
    FactoryBot.create(:leaf, employee_id: employee.id, from_date: Time.now + 1.day, till_date: Time.now + 2.day)
  end
  before do
    sign_in(employee)
  end

  describe '#index' do
    it 'show all leave ' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe '#create' do
    it 'apply for leave' do
      post :create, params: { leaf: { employee_id: employee.id, from_date: Time.now, till_date: Time.now } }
      expect(response.status).to eq(200)
    end
  end

  describe '#update' do
    it 'employee can cancelled leave if from date grether then current date' do
      patch :update, params: { id: leaf.id }
      expect(response.status).to eq(302)
    end
  end
end
