# frozen_string_literal: true

# application controller
module ApplicationHelper
  def salary_total
    # array = []
    # current_employee.salaries.each do |s|
    #   next unless s.created_at.strftime('%m-%y') == Time.zone.now.strftime('%m-%y')

    #   current_employee.attendences.each do |a|
    #     array << a.checkin_time.strftime('%d-%m-%y')
    #     array.uniq
    #   end
    #   return s.salary / 30 * array.uniq.count
    # end
  end


  def employee_role
    current_employee&.role&.name == 'HR'
  end
end
