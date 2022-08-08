# frozen_string_literal: true

class SalariesController < InheritedResources::Base
  before_action :authenticate_employee!
  before_action :set_salary, only: %i[show edit update]
  after_action :update_download_satus, only: %i[show]
  load_and_authorize_resource

  def index
    @salaries = if current_employee.is_hr? || current_employee.is_admin?
                  if params[:search].nil?
                    Salary.where(month: Date.today.month - 1)
                  else
                    Salary.search(params[:search])
                  end
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

  def set_salary
    @salary = Salary.find_by_id params[:id]
    redirect_to root_path, alert: I18n.t('employee.not_found') unless @salary.present?
  end

  def update_download_satus
    @salary.update(download_status: false)
  end

  def salary_params
    params.require(:salary).permit(:salary, :employee_id, :month, :leaves, :earnings, :deductions, :total_working_days,
                                   :download_status)
  end
end
