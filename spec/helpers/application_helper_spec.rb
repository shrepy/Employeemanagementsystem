# frozen_string_literal: true

require 'rails_helper'

# Specs in this file have access to a helper object that includes

RSpec.describe ApplicationHelper, type: :helper do
  # describe 'checkin' do
  #   let!(:employee) { FactoryBot.create(:employee) }
  #   before do
  #     sign_in(employee)
  #   end
  #   let!(:attendence) { FactoryBot.create(:attendence, employee_id: employee.id, checkin_time: Time.zone.now) }
  #   it 'if attendence checkout_time update show checkin button' do
  #     expect(helper.checkout).to eq nil
  #   end
  # end

  # describe 'checkout' do
  #   let!(:employee) { FactoryBot.create(:employee) }
  #   before do
  #     sign_in(employee)
  #   end
  #   let!(:attendence) do
  #     FactoryBot.create(:attendence, employee_id: employee.id, checkin_time: Time.zone.now, checkout_time: nil)
  #   end
  #   it 'if attendence checkout_time not update show checkout button' do
  #     expect(helper.checkout).to eq attendence.id
  #   end
  # end

  describe 'date format' do
    it 'if date is blank than it will return nil' do
      date = nil
      expect(helper.date_format(date)).to eq('')
    end

    it 'if date is available than date will appear in this format 17 Aug 2022' do
      date = Time.now.to_date
      expect(helper.date_format(date)).to eq('22 Aug 2022')
    end
  end
end
