# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Employee, type: :model do
  let!(:designation) { FactoryBot.create(:designation) }
  let!(:role) { FactoryBot.create(:role) }
  let!(:employee) { create :employee, leave_count: 1, designation_id: designation.id, role_id: role.id, name: 'xyz' }
  let!(:leaf) do
    create :leaf, employee_id: employee.id, from_date: Time.zone.now, till_date: Time.zone.now, leave_status: 'accept',
                  updated_at: Time.zone.now
  end
  let!(:attendence) { FactoryBot.create(:attendence, employee_id: employee.id) }

  it 'available leave balance' do
    expect(employee.reload.leave_count).to eq(0)
  end

  it 'search employee' do
    search = 'xyz'
    expect(Employee.search(search)).to eq([employee])
  end

  it 'show checkin button' do
    expect(employee.show_checkin?).to eq(true)
  end

  it 'check hr role' do
    expect(employee.is_hr?).to eq(true)
  end

  describe 'show checkout button' do
    let!(:employee) { create :employee, leave_count: 1, designation_id: designation.id, role_id: role.id, name: 'xyz' }
    let!(:attendence_one) do
      FactoryBot.create(:attendence, employee_id: employee.id, checkin_time: Time.now, checkout_time: '')
    end
    it ' show checkout button' do
      expect(employee.show_checkin?).to eq(nil)
    end
  end
end
