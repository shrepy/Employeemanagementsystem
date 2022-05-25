# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Hr::LeafsController, type: :controller do
  fixtures :all

  let!(:designation) { FactoryBot.create(:designation) }
  let!(:employee) { FactoryBot.create(:employee, role_id: roles(:role_one).id, designation_id: designation.id) }
  let!(:leaf) do
    FactoryBot.create(:leaf, employee_id: employee.id, from_date: Time.now.to_date, till_date: Time.now.to_date)
  end

  before do
    sign_in(employee)
  end

  describe '#employee leave index' do
    it 'Hr can see all employee leave' do
      get :employee_leave_index, params: { id: employee.id }
      expect(assigns(:leafs)).to eq([leaf])
    end
  end

  describe '#update' do
    it 'Hr can accept leave' do
      leaf.leave_status = 'accept'
      patch :update, params: { id: leaf.id }
      expect(assigns(:leaf)).to eq(leaf)
    end

    it 'Hr can decline leave' do
      leaf.leave_status = 'decline'
      patch :update, params: { id: leaf.id }
      expect(assigns(:leaf)).to eq(leaf)
    end
  end
end
