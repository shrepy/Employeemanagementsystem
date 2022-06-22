# frozen_string_literal: true

module AdminMain
  class AttendencesController < ApplicationController
    before_action :set_attendance, only: %i[show edit update]

    def index
      @attendences = Attendence.order('created_at desc').page(params[:page])
    end

    def show
      employee_attendence(@attendence.employee_id)
    end

    def edit; end

    def update
      if params[:attendence].present?
        if @attendence.update(attendence_params)
          redirect_to admin_main_attendence_path
        else
          render :edit
        end
      else
        redirect_to admin_main_attendence_path
      end
    end

    private

    def set_attendance
      @attendence = Attendence.find_by_id params[:id]
      redirect_to root_path, { notice: 'NOT FOUND :)' } unless @attendence.present?
    end

    def attendence_params
      params.require(:attendence).permit(:checkout_time)
    end

    def employee_attendence(employee_id)
      @attendences = Attendence.where(employee_id: employee_id)
    end
  end
end
