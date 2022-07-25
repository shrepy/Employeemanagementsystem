# frozen_string_literal: true

module Api
  module V1
    class DailyTaskSerializer < ActiveModel::Serializer
      attributes :id, :description, :created_at, :updated_at
      def created_at
        object&.created_at.strftime("%d-%I-%y")
      end
      
      def updated_at
        object&.created_at.strftime("%d-%I-%y")
      end
    end
  end
end
