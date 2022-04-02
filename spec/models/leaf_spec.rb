# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Leaf, type: :model do
  let!(:employee) { create :employee }
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
  end
end
