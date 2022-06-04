module Api
  module V1
    class ApplicationController < ActionController::Base
      # protect_from_forgery unless: -> { request.format.json? }
      protect_from_forgery with: :null_session, if: :devise_controller?
      def current_employee
        byebug
        Employee.first
      end

      def serializer_data(data, serializer)
        ActiveModelSerializers::SerializableResource.new(data, each_serializer: serializer)
      end
    end
  end
end
