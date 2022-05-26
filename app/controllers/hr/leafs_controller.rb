# frozen_string_literal: true

module Hr
  # hr can accept and decline leave
  class LeafsController < ApplicationController
    before_action :set_leaves, only: %i[update]
    def index
      @employee = Employee.find(params[:id])
      @leafs = @employee.leafs.order('created_at DESC')
    end

    def update
      @leaf.update(leave_status: params[:leave_status])

      redirect_to employees_path
    end

    private

    def set_leaves
      @leaf = Leaf.find_by_id params[:id]
      redirect_to root_path, { notice: 'NOT FOUND :)' } unless @leaf.present?
    end
  end
end
