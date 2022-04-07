class TotalSalaryJob < ApplicationJob
  queue_as :default

  def perform
    employees = Employee.all
    employees.each do |employee|
      employee.salaries.build(salary: employee.salary, month:  Date.today.strftime('%B'))
      employee.save
    end
  end
end
