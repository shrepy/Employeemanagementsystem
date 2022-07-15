# frozen_string_literal: true

# admin can create monthly salary details
class MonthlySalary < ApplicationRecord
  has_many :salaries, dependent: :destroy
  after_create :salary_create
  validates :monthly_working_days, presence: { message: ' is required' }
  validates :month, uniqueness: { message: ' will not repeat again' }
  validate :month_status

  def salary_create
    employees = Employee.all
    employees.each do |employee|
      salaries.create(month: month, employee_id: employee.id)
    end
  end

  private

  def month_status
    errors[:base] << 'You can create salary only one month ago ' unless Date.today.month - 1 == month.to_i
  end
end
