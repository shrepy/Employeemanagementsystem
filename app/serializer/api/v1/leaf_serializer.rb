# frozen_string_literal: true

module Api
  module V1
    class LeafSerializer < ActiveModel::Serializer
      attributes :id, :leave_type, :from_date, :till_date, :total_days, :reason, :leave_status
      def from_date
        object&.from_date&.strftime('%d %b %Y')
      end

      def till_date
        object&.till_date&.strftime('%d %b %Y')
      end
    end
  end
end
