# frozen_string_literal: true

module Hr
  class AttendencesController < ApplicationController
    def show_attendence 
      if current_employee.is_hr?
        @employee = Employee.find(params[:id])
        @attendences = Attendence.where(employee_id: @employee.id)
      else
        redirect_to root_path
      end
    end
  end
end


