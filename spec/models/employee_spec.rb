# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Employee, type: :model do
  let!(:role) { create :role, name: 'Employee' }
  let!(:designation) { create :designation, name: 'Hr' }
  let!(:employee) do
    create :employee, leave_count: 1, role_id: role.id, designation_id: designation.id, joining_date: '2022-05-22'
  end
  let!(:leaf) do
    create :leaf, employee_id: employee.id, from_date: Time.zone.now, till_date: Time.zone.now, leave_status: 'accept',
                  updated_at: Time.zone.now
  end

  it 'available leave balance' do
    expect(employee.reload.leave_count).to eq(0)
  end

  it 'validate joining date' do
    employee.joining_date = nil
    expect(employee.save).to eq(false)
  end
end
