# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Employee, type: :model do
  let!(:employee) { create :employee, leave_count: 1 }
  let!(:leaf) do
    create :leaf, employee_id: employee.id, from_date: Time.zone.now, till_date: Time.zone.now, leave_status: 'accept',
                  updated_at: Time.zone.now
  end

  it 'available leave balance' do
    expect(employee.reload.leave_count).to eq(0)
  end
end
