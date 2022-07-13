# frozen_string_literal: true

# admin can create monthly salary details
class MonthlySalary < ApplicationRecord
  has_many :salaries, dependent: :destroy
  after_create :salary_create
  validates :monthly_working_days, presence: true
  validates :month, uniqueness: true

  def salary_create
    employees = Employee.all
    employees.each do |employee|
      salaries.create(month: month, employee_id: employee.id)
    end
  end
end
