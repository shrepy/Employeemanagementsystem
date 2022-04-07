class AttendenceJob < ApplicationJob
  queue_as :default

  def perform
    attendences = Attendence.all
    employees = Employee.all
    employees.each do |employee|
      a = employee.attendences.pluck(:created_at)
      z = []
      a.each do |b|
        z << b.strftime('%d-%m-%y')
      end
      unless z.include?(Date.today.strftime('%d-%m-%y'))
          if Date.today.strftime('%A') == "Sunday"
             employee.attendences.build(status: "Holiday")
             employee.save
          else
             employee.attendences.build(status: "Absent")
             employee.save
          end
      end
    end
  end
end
