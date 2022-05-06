# frozen_string_literal: true

module Hr
  class AttendencesController < ApplicationController
    include ApplicationHelper
    def show_attendence
      return unless employee_role

      @employee = Employee.find(params[:id])
      @attendences = Attendence.where(employee_id: @employee.id)
    end
  end
end
