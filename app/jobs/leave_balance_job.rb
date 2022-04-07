class LeaveBalanceJob < ApplicationJob
  queue_as :default

  def perform
    leaves = Employee.all
    leaves.each do |leave|
      leave.increment!(:leave_count)
    end
  end
end

