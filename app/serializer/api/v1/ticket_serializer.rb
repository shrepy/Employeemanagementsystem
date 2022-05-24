# frozen_string_literal: true

module Api
  module V1
    class TicketSerializer < ActiveModel::Serializer
      attributes :id, :status, :description, :ticket_type, :employee_id, :reason
    end
  end
end
