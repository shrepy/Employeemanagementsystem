# frozen_string_literal: true

module Api
  module V1
    class AttendenceSerializer < ActiveModel::Serializer
      attributes :id, :checkin_time, :checkout_time, :status, :hour
      def checkin_time
        object&.checkin_time&.strftime('%a %b %d %y %I:%M:%S %p')
      end

      def checkout_time
        object&.checkout_time&.strftime('%a %b %d %y %I:%M:%S %p')
      end
    end
  end
end
