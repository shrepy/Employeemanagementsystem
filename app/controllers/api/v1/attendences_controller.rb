# frozen_string_literal: true

module Api
  module V1
    class AttendencesController < ApplicationController
      # before_action :authenticate_employee!
      before_action :set_attendance, only: %i[show]
      skip_before_action :verify_authenticity_token

      def index
        data = get_employee.attendences.order(created_at: :desc)
        render json: {
          data: serializer_data(data, serializer),
          message: ['daily attendence list '], status: 200, type: 'Success'
        }
      end

      def show
        data = Attendence.where(employee_id: @attendence.employee_id)
        render json: {
          data: serializer_data(data, serializer),
          message: ['show daily attendence  '], status: 200, type: 'Success'
        }
      end

      def create
        data = Attendence.where(checkin_time: Time.zone.now - 2.minutes..Time.zone.now,
                                employee_id: get_employee.id).last
        if data.nil?
          data = Attendence.create(employee_id: get_employee.id, checkin_time: Time.zone.now,
                            status: 'Present', checkin_ip_address: request.remote_ip)
        else
          data.update_column('checkout_time', nil)
        end
        render json: {
          data: serializer_data(data, serializer),
          message: ['successfully checkin  '], status: 200, type: 'Success'
        }
      end

      def update
        data = get_employee.todays_last_attendence
        data.update(checkout_time: Time.zone.now, checkout_ip_address: request.remote_ip)
        render json: {
          data: serializer_data(data, serializer),
          message: ['successfully updated  '], status: 200, type: 'Success'
        }
      end

      def set_attendance
        @attendence = get_employee.attendences.find_by_id params[:id]
        redirect_to root_path
      end

      private

      def serializer
        Api::V1::AttendenceSerializer
      end
    end
  end
end
