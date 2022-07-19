# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Salary, type: :model do
  fixtures :all

  let!(:designation) { create :designation, name: 'Employee' }
  let!(:employee) { create :employee, role_id: roles(:role_one).id, designation_id: designation.id, salary: 20_000 }
  let!(:monthly_salaray) { create :monthly_salary, month: '06', monthly_working_days: 26 }
  let!(:attendence) do
    create :attendence, employee_id: employee.id, checkin_time: '2022-03-01 12:51:52',
                        checkout_time: '2022-04-26 12:51:52'
  end
  let!(:salary) { create :salary, employee_id: employee.id, monthly_salary_id: monthly_salaray.id, month: '06' }

  it 'is valid with valid attributes' do
    salary.validate
    expect(salary.salary).to eq(20_000)
  end

  it 'is valid without valid attributes' do
    salary = Salary.new(salary: nil, monthly_salary_id: monthly_salaray.id, employee_id: employee.id)
    expect(salary.valid?).to be false
  end

  it 'is valid with valid attributes' do
    salary.validate
    expect(salary.month).to eq('06')
  end

  it 'is valid without valid attributes' do
    salary = Salary.new(month: nil, monthly_salary_id: monthly_salaray.id, employee_id: employee.id)
    expect(salary.valid?).to be false
  end

  it '#update total working days when employee leave is 26' do
    salary.run_callbacks :create
    expect(salary.total_working_days).to eq(0.0)
  end

  it '#employee salary when total working days is zero' do
    salary.earnings = 0
    salary.run_callbacks :create
    expect(salary.earnings).to be(0)
  end

  it '#update total working days when employee leave is zero' do
    salary.total_working_days = 208
    salary.run_callbacks :create
    expect(salary.total_working_days).to be(208)
  end

  it '#employee salary when total working days is 26' do
    salary.earnings = 20_000
    salary.run_callbacks :create
    expect(salary.earnings).to be(20_000)
  end

  it '#update total working days when employee leave is 6' do
    salary.total_working_days = 26 - 0o6
    salary.run_callbacks :create
    expect(salary.total_working_days).to eq(20)
  end

  it '#employee salary when total working days is 20' do
    salary.earnings = 15_384
    salary.run_callbacks :create
    expect(salary.earnings).to be(15_384)
  end

  it '#employee total leaves is 06' do
    salary.leaves = 26 - 0o6
    salary.run_callbacks :create
    expect(salary.leaves).to eq(20)
  end

  it '#employee deduction when leave is 06' do
    salary.leaves = 20_000 - 15_384
    salary.run_callbacks :create
    expect(salary.leaves).to eq(4616)
  end

  it '#employee total leaves is 00' do
    salary.leaves = 26 - 0o0
    salary.run_callbacks :create
    expect(salary.leaves).to eq(26)
  end

  it '#employee deduction when leave is 06' do
    salary.leaves = 20_000 - 0o0
    salary.run_callbacks :create
    expect(salary.leaves).to eq(20_000)
  end

  it '#employee total leaves is 26' do
    salary.leaves = 26 - 26
    salary.run_callbacks :create
    expect(salary.leaves).to eq(0o0)
  end

  it '#employee deduction when leave is 06' do
    salary.leaves = 20_000 - 20_000
    salary.run_callbacks :create
    expect(salary.leaves).to eq(0)
  end
end
