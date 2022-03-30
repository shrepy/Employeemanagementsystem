class LeafsController < InheritedResources::Base
  private

    def leaf_params
      params.require(:leaf).permit(:available_balance, :leave_type, :from_date, :till_date, :leave_starts, :leave_end, :total_days, :resion, :leave_status, :employee_id)
    end

end
