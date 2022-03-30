# frozen_string_literal: true

# application controller
module ApplicationHelper
  def checkout
    return unless current_employee.attendences.present?

    attendence_id = []
    current_employee.attendences.each do |attendence|
      if attendence.checkin_time.strftime('%d-%m-%y') == Time.zone.now.strftime('%d-%m-%y')
        attendence_id << attendence.id
      end
    end

    find_last_id = attendence_id.last
    show_checking_button(find_last_id)
  end

  def show_checking_button(id)
    attendence = current_employee.attendences.find(id)
    attendence.id if attendence.checkout_time.nil?
  end

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
end
