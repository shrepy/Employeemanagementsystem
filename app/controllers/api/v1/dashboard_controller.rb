# frozen_string_literal: true

module Api
  module V1
    class DashboardController < ApplicationController
      before_action :authenticate_employee!
      skip_before_action :verify_authenticity_token
      def index
        employees_birthday = Employee.where('EXTRACT(DAY FROM date_of_birth) = ?', Date.current.day).where(
          'EXTRACT(MONTH FROM date_of_birth) = ?', Date.current.month
        )
        recent_join_employees = Employee.where(joining_date: (Time.now.to_date - 2.day)..Time.now.to_date)
        upcoming_holidays = Holiday.where('holiday_date > ?', Time.now.to_date).limit(5)
        dashboard_serializer = {}
        dashboard_serializer[:employees_birthday] = serializer_data(employees_birthday, employee_serializer)
        dashboard_serializer[:recent_join_employees] = serializer_data(recent_join_employees, employee_serializer)
        dashboard_serializer[:upcoming_holidays] = serializer_data(upcoming_holidays, holiday_serializer)
        render json: {
          data: dashboard_serializer,
          message: ['Your are on dashboard Page '], status: 200, type: 'Success'
        }
      end

      def employee_serializer
        Api::V1::EmployeeSerializer
      end

      def holiday_serializer
        Api::V1::HolidaySerializer
      end
    end
  end
end
