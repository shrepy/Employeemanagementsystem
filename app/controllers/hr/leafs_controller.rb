# frozen_string_literal: true

module Hr
  # hr can accept and decline leave
  class LeafsController < ApplicationController
    def employee_leave_index
      @employee = Employee.find(params[:id])
      @leafs = @employee.leafs.order('created_at DESC')
    end

    def update
      @leaf = Leaf.find(params[:id])
      @leaf.update(leave_status: params[:leave_status])

      redirect_to hr_leafs_path
    end
  end
end
