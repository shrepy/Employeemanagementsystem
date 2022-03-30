# frozen_string_literal: true

require 'rails_helper'

# Specs in this file have access to a helper object that includes

RSpec.describe ApplicationHelper, type: :helper do
  describe 'checkin' do
    let!(:employee) { FactoryBot.create(:employee) }
    before do
      sign_in(employee)
    end
    let!(:attendence) { FactoryBot.create(:attendence, employee_id: employee.id, checkin_time: Time.zone.now) }
    it 'if attendence checkout_time update show checkin button' do
      expect(helper.checkout).to eq nil
    end
  end

  describe 'checkout' do
    let!(:employee) { FactoryBot.create(:employee) }
    before do
      sign_in(employee)
    end
    let!(:attendence) do
      FactoryBot.create(:attendence, employee_id: employee.id, checkin_time: Time.zone.now, checkout_time: nil)
    end
    it 'if attendence checkout_time not update show checkout button' do
      expect(helper.checkout).to eq attendence.id
    end
  end
end
