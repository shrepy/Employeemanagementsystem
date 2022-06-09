# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Employee, type: :model do
  fixtures :all

  let!(:designation) { create :designation, name: 'Hr' }
  let!(:employee) do
    create :employee, leave_count: 1, role_id: roles(:role_one).id, designation_id: designation.id
  end
  let!(:employee_one) do
    create :employee, leave_count: 1, role_id: roles(:role_two).id, designation_id: designation.id,
                      joining_date: '2022-05-22'
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

  it 'return true if employee role is Hr' do
    expect(employee.is_hr?).to eq(true)
  end

  it 'return false if employee role is Employee' do
    expect(employee_one.is_hr?).to eq(false)
  end

  it 'on update return false when joining date nil' do
    expect(employee.update(joining_date: nil)).to eq(false)
  end

  it 'on update return false when joining date validate failed' do
    expect(employee.update(joining_date: '2019-05-14')).to eq(false)
  end

  it 'on update return true when joining date validate pass' do
    expect(employee.update(joining_date: '2021-05-14')).to eq(true)
  end

  describe 'Phone number validation on update' do
    it 'phone number should be present' do
      expect(employee.update(phone_number: '1234567890')).to eq(true)
    end

    it 'phone number should not be nil' do
      expect(employee.update(phone_number: nil)).to eq(false)
    end

    it 'phone number should be 10 digits' do
      expect(employee.update(phone_number: '1234567890')).to eq(true)
    end

    it 'phone number should be not 10 digits' do
      expect(employee.update(phone_number: '1234567')).to eq(false)
    end
  end

  describe 'validation for on update' do
    it 'account number aadhar card number pan card number not be nil' do
      expect(employee.update(account_number: nil, pan_card_number: nil, aadhar_card_number: nil)).to eq(false)
    end

    it 'account number aadhar card number pan card number should be present' do
      expect(employee.update(account_number: '23132425', pan_card_number: '1324443',
                             aadhar_card_number: '8452835')).to eq(true)
    end

    it 'account number aadhar card number pan card number should be only numbers' do
      expect(employee.update(account_number: '23fdg132425', pan_card_number: '1324dg443',
                             aadhar_card_number: '8452sd835')).to eq(false)
    end

    it 'employee should be 18+' do
      expect(employee.update(date_of_birth: '22/08/2006')).to eq(false)
    end
  end

  describe 'validation for date of birth on update' do
    it 'employee date of birth should be not nil' do
      expect(employee.update(date_of_birth: nil)).to eq(false)
    end

    it 'employee should not be lessthen 18 years' do
      expect(employee.update(date_of_birth: '2006/06/20')).to eq(false)
    end

    it 'employee should be 18 +' do
      expect(employee.update(date_of_birth: '2003/06/20')).to eq(true)
    end
  end
end
