# frozen_string_literal: true

# attendencecontroller
module Hr
  class AttendencesController < ApplicationController
    before_action :set_attendance, only: %i[show edit update]

    def show_attendence
      @employee = Employee.find(params[:id])
      @attendences = Attendence.where(employee_id: @employee.id)
    end

    def show
      @attendences = Attendence.where(employee_id: @attendence.employee_id)
    end

    def edit; end

    def update
      if params[:attendence].present?
        if @attendence.update(attendence_params)
          redirect_to hr_attendence_path
        else
          render :edit
        end
      else
        redirect_to hr_attendence_path
      end
    end

    def search
      @attendences = Attendence.search(params)
    end

    private

    def set_attendance
      @attendence = Attendence.find_by_id params[:id]
      redirect_to root_path, { notice: 'NOT FOUND :)' } unless @attendence.present?
    end

    def attendence_params
      params.require(:attendence).permit(:checkout_time)
    end
  end
end
