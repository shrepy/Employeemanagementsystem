# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LeafsController, type: :controller do
  fixtures :all

  let!(:designation) { FactoryBot.create(:designation) }
  let!(:employee) { FactoryBot.create(:employee, role_id: roles(:role_one).id, designation_id: designation.id) }
  let!(:employee_one) { FactoryBot.create(:employee, role_id: roles(:role_one).id, designation_id: designation.id) }
  let!(:leaf) do
    FactoryBot.create(:leaf, employee_id: employee.id, from_date: Time.now.to_date, till_date: Time.now.to_date)
  end
  before do
    sign_in(employee)
  end

  describe '#show' do
    it 'redirect to leafs path when leaf is find' do
      get :show, params: { id: leaf.id }
      expect(response).to redirect_to(redirect_to(leafs_path))
    end

    it 'redirect to leafs path when leaf is find' do
      get :show, params: { id: '' }
      expect(response).to redirect_to(redirect_to(root_path))
    end
  end
end
