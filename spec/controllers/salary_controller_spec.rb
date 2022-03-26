# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SalariesController, type: :controller do
  # context '#index' do
  employee = FactoryBot.create(:employee)
  let!(:salary) { FactoryBot.create(:salary, employee_id: employee.id) }
  describe 'index' do
    it 'Get Performance' do
      get :index
      expect(response.status).to eq(200)
    end
  end
end
