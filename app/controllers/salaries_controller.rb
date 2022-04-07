# frozen_string_literal: true

# salaries controller
class SalariesController < InheritedResources::Base


  def show
    @salary = Salary.find_by_id params[:id]
    respond_to do |format|
      format.html
      format.pdf do
        render template: "salaries/show.html.erb",
          pdf: "Salary of Month: #{@salary.id}"
      end
    end
  end

  private

  def salary_params
    params.require(:salary).permit(:salary, :month, :total, :employee_id)
  end
end
