# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HolidaysController, type: :controller do
  # context '#index' do
  let!(:holiday) { FactoryBot.create(:holiday) }
  describe 'index' do
    it 'Get Employee' do
      get :index
      expect(response.status).to eq(200)
    end
  end
end
