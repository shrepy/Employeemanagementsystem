# frozen_string_literal: true

module Api
  module V1
    class EmployeesController < ApplicationController
      before_action :authenticate_employee!
      before_action :set_employee, only: %i[show update]
      # skip_before_action :verify_authenticity_token

      # GET /employees/1 or /employees/1.json
      def show
        render json: {
          data: serializer_data(@employee_data, employee_serializer),
          message: ['employee profile '], status: 200
        }
      end

      # PATCH /employees/1 or /employees/1.json
      def update
        if @employee_data.update(employee_params)
          render json: {
            data: serializer_data(@employee_data, employee_serializer),
            message: ['password successfully update'], status: 200, type: 'Success'
          }
        else
          render json: @employee_data, status: 404
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_employee
        @employee_data = Employee.find_by_id(params[:id])
        render json: { message: 'Not Found' }, status: 404 unless @employee_data.present?
      end

      def employee_params
        params.require(:employee).permit(:email, :password, :password_confirmation)
      end

      def employee_serializer
        Api::V1::EmployeeSerializer
      end
    end
  end
end
