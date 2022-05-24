# frozen_string_literal: true

module Api
  module V1
    class TicketsController < ApplicationController
      # before_action :authenticate_employee!

      skip_before_action :verify_authenticity_token

      def index
        current_employee
        data = Ticket.where(employee_id: current_employee)
        render json: {
          data: serializer_data(data, serializer),
          message: ['show tickets '], status: 200, type: 'Success'
        }
      end

      def create
        data = Ticket.new(ticket_params)
        if data.save
          render json: {
            data: serializer_data(data, serializer),
            message: ['Successfully ticket create '], status: 200, type: 'Success'
          }
        else
          render json: data
        end
      end

      def update
        data = Ticket.find(params[:id])
        if data.status.nil?
          if data.update(status: 'accept', updated_by: current_employee.name)
            render json: {
              data: serializer_data(data, serializer),
              message: ['Successfully daily task create '], status: 200, type: 'Success'
            }
          else
            render :index
          end
        else
          render json: data
        end
      end

      private

      def ticket_params
        params.require(:ticket).permit(:status, :description, :ticket_type, :employee_id, :reason)
      end

      def serializer
        Api::V1::TicketSerializer
      end
    end
  end
end
