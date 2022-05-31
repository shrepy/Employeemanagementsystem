# frozen_string_literal: true

module Api
  module V1
    class HolidaysController < ApplicationController
      # before_action :authenticate_employee!
      skip_before_action :verify_authenticity_token

      def index
        holiday_data = Holiday.all
        render json: {
          data: serializer_data(holiday_data, holiday_serializer),
          status: 200, type: 'Success'
        }
      end

      private

      def holiday_serializer
        Api::V1::HolidaySerializer
      end

      def holiday_params
        params.require(:holiday).permit(:holiday_date, :holiday_name)
      end
    end
  end
end
