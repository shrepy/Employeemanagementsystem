# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Leaf, type: :model do
  designation = FactoryBot.create(:designation)
  role = FactoryBot.create(:role)
  let!(:employee) do
    create :employee, designation_id: designation.id, role_id: role.id, account_number: '8645396793',
                      pan_card_number: '846353986798', aadhar_card_number: '328746328653867', phone_number: '4545454545'
  end
  let!(:leaf) { create :leaf, employee_id: employee.id, from_date: Time.zone.now, till_date: Time.zone.now }
  it 'count total days when leave starts and leave end with Half day' do
    leaf.leave_starts = 'Half Day'
    leaf.leave_end = 'Half Day'
    leaf.run_callbacks :create
    expect(leaf.total_days).to be(0.0)
  end

  it 'count total days when leave starts leave end with Full day' do
    leaf.leave_starts = 'Full Day'
    leaf.leave_end = 'Full Day'
    leaf.run_callbacks :create
    expect(leaf.total_days).to be(1.0)
  end

  it 'count total days when leave starts with Full day' do
    leaf.leave_starts = 'Full Day'
    leaf.run_callbacks :create
    expect(leaf.total_days).to be(1.0)
  end

  it 'count total days when leave end with Full day' do
    leaf.leave_end = 'Full Day'
    leaf.run_callbacks :create
    expect(leaf.total_days).to be(1.0)
  end

  it 'count total days when leave starts Full day and leave end with Half day' do
    leaf.from_date =  Time.zone.now - 1.day
    leaf.leave_starts = 'Full Day'
    leaf.leave_end = 'Half Day'
    leaf.run_callbacks :create
    expect(leaf.total_days).to be(1.5)
  end

  it 'count total days when leave starts Half day and leave end with Full day' do
    leaf.from_date =  Time.zone.now - 1.day
    leaf.leave_starts = 'Half Day'
    leaf.leave_end = 'Full Day'
    leaf.run_callbacks :create
    expect(leaf.total_days).to be(1.5)
  end

  describe '#validation' do
    it 'validate from date' do
      leaf.from_date = Time.now.to_date - 1.day
      leaf.validate
      expect(leaf.check_past_date.type).to eq('Please select right date :)')
    end

    it 'validate till date' do
      leaf.till_date = Time.now.to_date - 1.day
      leaf.validate
      expect(leaf.check_past_date.type).to eq('Please select right date :)')
    end

    it 'leave allow only 30 days' do
      leaf.from_date = Time.now.to_date
      leaf.till_date = Time.now.to_date + 23.days
      leaf.run_callbacks :validation
      expect(leaf.total_days).to be(24.0)
    end

    it 'if total leave count 30 days show error message' do
      leaf.from_date = Time.now.to_date
      leaf.till_date = Time.now.to_date + 1.month
      expect(leaf.leave_days.type).to eq('You Can Apply only 30 days leave :)')
    end
  end
end
