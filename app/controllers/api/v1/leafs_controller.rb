# frozen_string_literal: true

module Api
  module V1
    class LeafsController < ApplicationController
      # before_action :authenticate_employee!
      skip_before_action :verify_authenticity_token

      def index
        @leaf_data = Leaf.where(employee_id: current_employee.id).order('created_at DESC')
        render json: {
          data: serializer_data(@leaf_data, serializer),
          message: ['leaf list '], status: 200, type: 'Success'
        }
      end

      def create
        leaf_data = Leaf.new(leaf_params)
        if leaf_data.save
          render json: {
            data: serializer_data(leaf_data, serializer),
            message: ['Successfully leave applied '], status: 200, type: 'Success'
          }
        else
          render json: { message: ['leave not applied'] }, status: 404, type: 'failed'
        end
      end

      def update
        @leaf_data = Leaf.find(params[:id])
        if @leaf_data.from_date > Time.now
          if @leaf_data.update(leave_status: 'cancelled')
            render json: {
              data: serializer_data(@leaf_data, serializer),
              message: ['leaf cancelled'], status: 200, type: 'Success'
            }
          else
            render json: @leaf_data
          end
        else
          render json: { message: ['leave status not update'] }, status: 304, type: 'failed'
        end
      end

      private

      def serializer
        Api::V1::LeafSerializer
      end

      def leaf_params
        params.require(:leaf).permit(:leave_type, :from_date, :till_date, :leave_starts, :leave_end, :total_days,
                                     :resion, :leave_status, :employee_id)
      end
    end
  end
end
