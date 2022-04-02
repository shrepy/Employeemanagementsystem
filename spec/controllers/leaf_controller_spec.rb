# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LeafsController, type: :controller do
  describe 'index' do 
    employee = FactoryBot.create(:employee)
    leave = FactoryBot.create(:leaf, employee_id: employee.id, from_date: Time.now, till_date: Time.now)

    it 'Get all leave ' do
      get :index
      expect(response.status).to eq(200)
    end

  end 

  describe 'create' do
    employee = FactoryBot.create(:employee)
    before do
      sign_in(employee)
    end

    it 'apply for leave' do
      post :create, params: { leaf: {employee_id: employee.id, from_date: Time.now, till_date: Time.now} }
      expect(response.status).to eq(302)
    end
  end

end
