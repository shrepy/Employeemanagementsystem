# frozen_string_literal: true

module Hr
  class AttendencesController < ApplicationController
    def show_attendence 
      return unless current_employee.is_hr?

      @employee = Employee.find(params[:id])
      @attendences = Attendence.where(employee_id: @employee.id)
    end
  end
end


