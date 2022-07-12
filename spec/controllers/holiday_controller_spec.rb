# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HolidaysController, type: :controller do
  fixtures :all
  let!(:designation) { FactoryBot.create(:designation) }
  let!(:employee) { FactoryBot.create(:employee, role_id: roles(:role_one).id, designation_id: designation.id) }
  let!(:holiday) { FactoryBot.create(:holiday) }
  let!(:holiday_one) { FactoryBot.create(:holiday) }
  before do
    sign_in(employee)
  end
  describe '#index' do
    it 'Get Holidays' do
      get :index
      expect(assigns(:holidays).count).to eq(2)
      expect(response.status).to eq(200)
    end
  end

  describe '#new' do
    it 'show holiday form' do
      get :new
      expect(response.status).to eq(200)
    end
  end

  describe '#create' do
    it 'response successfully when holiday created' do
      post :create, params: { holiday: { holiday_name: 'xyz', holiday_date: '2022-04-23', holiday_type: :National } }
      expect(response.status).to eq(302)
    end
  end

  describe '#validation' do
    it 'holiday name cant be blank' do
      post :create, params: { holiday: { holiday_name: nil } }
      expect(response.status).to eq(302)
    end

    it 'holiday date cant be blank' do
      post :create, params: { holiday: { holiday_date: nil } }
      expect(response.status).to eq(302)
    end

    it 'holiday type cant be blank' do
      post :create, params: { holiday: { holiday_type: :National } }
      expect(response.status).to eq(302)
    end
  end
end
