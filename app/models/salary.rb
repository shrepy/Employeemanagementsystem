# frozen_string_literal: true

# employee salary model
class Salary < ApplicationRecord
  belongs_to :employee, dependent: :destroy
  belongs_to :monthly_salary, dependent: :destroy
  before_create :update_total_working_days
  before_create :total_earnings
  before_create :total_leaves
  before_create :total_deductions
  before_validation :validates_salary
  validates :salary, presence: true
  validates :month, presence: true

  def validates_salary
    self.salary = employee.salary
  end

  def update_total_working_days
    self.total_working_days = employee_working_days / 8.ceil
  end

  def total_earnings
    hours = monthly_salary.monthly_working_days * 8
    salary_of_hours = salary / hours.to_f
    total_earning = employee_working_days * salary_of_hours
    self.earnings = total_earning
  end

  def total_deductions
    self.deductions = salary - earnings
  end

  def employee_working_days
    salary = self
    hour = employee.working_days(salary)
    working_hour = hour&.split(':')
    working_hour.join('.').to_f
  end

  def total_leaves
    leave = monthly_salary.monthly_working_days - total_working_days
    self.leaves = leave
  end

  def self.search(search)
    if search
      Salary.joins(:employee).where('employees.name LIKE ? OR month LIKE ? ', "%#{search}%", "%#{search}%")
    else
      all
    end
  end
end
