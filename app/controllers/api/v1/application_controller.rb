# frozen_string_literal: true

module Api
  module V1
    class ApplicationController < ActionController::Base
      def serializer_data(data, serializer)
        ActiveModelSerializers::SerializableResource.new(data, each_serializer: serializer)
      end
    end
  end
end
