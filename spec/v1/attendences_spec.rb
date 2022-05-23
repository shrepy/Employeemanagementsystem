# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::AttendencesController, type: :controller do
  let(:role) { FactoryBot.create(:role) }
  let(:designation) { FactoryBot.create(:designation) }
  let(:employee) { FactoryBot.create(:employee, designation_id: designation.id, role_id: role.id) }
  let(:attendence) { FactoryBot.create(:attendence, employee_id: employee.id) }

  before do
    sign_in(employee)
  end

  describe '#index' do
    it 'show all Attendences ' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe 'GET# Attendences#show' do
    before do
      get :show, params: { id: attendence.id }
    end

    it 'show the Attendences details' do
      expect(response.status).to eq(302)
    end
  end

  describe '#create' do
    it 'create a Attendences' do
      byebug
      post :create , params: { employee_id: employee.id }
      expect(response.status).to eq(200)
    end
  end

  describe '#update' do
    let!(:attendence) { FactoryBot.create(:attendence, employee_id: employee.id, checkin_time: Time.now) }
    it 'checkout by employee' do
      patch :update , params: { id: attendence.id } 
      expect(response.status).to eq(200)
    end
  end
end
