# frozen_string_literal: true
require 'rails_helper'

RSpec.describe AdminMain::HolidaysController, type: :controller do
  let!(:holiday) { FactoryBot.create(:holiday) }
  let!(:holiday_one) { FactoryBot.create(:holiday) }

  describe '#index' do
    it 'Get Holidays' do
      get :index
      expect(assigns(:holidays).count).to eq(2)
      expect(response.status).to eq(200)
    end
  end

  describe '#new' do
    it 'create new holiday' do
      get :new
      expect(response.status).to eq(200)
    end
  end

  describe '#show' do
    it 'return nil when holiday not exist' do
      get :show, params: { id: '' }
      expect(assigns(:holiday)).to eq(nil)
    end
  end

  describe '#create' do
    it 'response successfully when holiday created' do
      post :create, params: { holiday: { holiday_name: 'xyz', holiday_date: '2022-04-23', holiday_type: :National } }
      expect(response.status).to eq(302)
    end
  end

  describe '#edit' do
    it 'response successfully when holiday exit' do
      get :edit, params: { id: holiday.id }
      expect(assigns(:holiday)).to eq(holiday)
    end

    it 'return nil when holiday not exit' do
      get :edit, params: { id: '' }
      expect(assigns(:holiday)).to eq(nil)
    end
  end

  describe '#update' do
    it 'response successfully when holiday data is updated' do
      patch :update,
            params: { holiday: { holiday_name: 'xyz', holiday_date: '2022-04-23', holiday_type: :National },
                      id: holiday.id }
      expect(assigns(:holiday)).to eq(holiday)
    end

    it 'return nil when holiday not exist' do
      patch :update,
            params: { holiday: { holiday_name: 'xyz', holiday_date: '2022-04-23', holiday_type: :National }, id: '' }
      expect(assigns(:holiday)).to eq(nil)
    end
  end
end
