# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HolidaysController, type: :controller do
  fixtures :all
  let!(:designation) { FactoryBot.create(:designation) }
  let!(:employee) { FactoryBot.create(:employee, role_id: roles(:role_one).id, designation_id: designation.id) }
  let!(:employee_two) { FactoryBot.create(:employee, role_id: roles(:role_two).id, designation_id: designation.id) }
  let!(:holiday) { FactoryBot.create(:holiday) }
  let!(:holiday_one) { FactoryBot.create(:holiday) }
  before do
    sign_in(employee_two)
  end
  describe '#index' do
    it 'Get Holidays' do
      get :index
      expect(assigns(:holidays).count).to eq(2)
      expect(response.status).to eq(200)
    end
  end

  describe '#new' do 
    it 'new' do
      get :new
      expect(response.status).to eq(302)
    end
  end 
end
