class SalariesController < InheritedResources::Base

  private

    def salary_params
      params.require(:salary).permit(:salary, :month, :total, :employee_id)
    end

end
