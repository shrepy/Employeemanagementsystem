# frozen_string_literal: true

class SalariesController < InheritedResources::Base
  before_action :authenticate_employee!
  before_action :set_salary, only: %i[show edit update]
  before_action :can_show_salary, only: %i[show]
  after_action :update_download_satus, only: %i[show]
  load_and_authorize_resource

  def index
    @salaries = if current_employee.is_admin?
                  Salary.where(employee_id: params[:employee_id])
                else
                  current_employee.salaries
                end
  end

  def edit; end

  def show
      respond_to do |format|
        format.html
        format.pdf do
          render template: 'salaries/show.html.erb',
                 pdf: "Salary of Month: #{@salary.id}"
        end
      end
  end

  def update
    redirect_to salaries_path if @salary.update(salary_params)
  end

  private

  def can_show_salary
    request.format = :pdf unless current_employee.is_admin?
    return if (@salary.monthly_salary.company_level && current_employee.is_admin?) || @salary.download_status
      redirect_to root_path, alert: 'access denied'
  end

  def set_salary
    @salary = Salary.find_by_id params[:id]
    redirect_to root_path, alert: I18n.t('employee.not_found') unless @salary.present? && (@salary.employee == current_employee || current_employee.is_admin?) 
  end

  def update_download_satus
    unless current_employee.is_admin? 
      @salary.update(download_status: false)
    end
  end

  def salary_params
    params.require(:salary).permit(:salary, :employee_id, :month, :leaves, :earnings, :deductions, :total_working_days,
                                   :download_status)
  end
end
