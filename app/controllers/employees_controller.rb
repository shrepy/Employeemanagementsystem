# frozen_string_literal: true

# Employee controller
class EmployeesController < ApplicationController
  before_action :authenticate_employee!
  load_and_authorize_resource
  before_action :set_employee, only: %i[show]

  # GET /employees or /employees.json
  def index
    @employees = Employee.search(params[:search])
    @designations = Designation.all
  end

  # GET /employees/1 or /employees/1.json
  def show
    @employee = if current_employee.is_hr?
                  Employee.find(params[:id])
                else
                  current_user
                end
  end

  def edit
    set_designation
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      redirect_to @employee
    else
      render :edit
    end
  end

  def profile
    @employee = Employee.all
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_employee
    @employee = Employee.find_by_id params[:id]
    render json: { message: 'Not Found' }, status: 404 if @employee.nil?
  end

  def set_designation
    @designations = Designation.all
    @skills = Skill.all
    @roles = Role.all
  end

  def employee_params
    params.require(:employee).permit(:name, :father_name, :mother_name, :phone_number, :address, :email, :bank_name,
                                     :account_number, :pan_card_number, :aadhar_card_number, :primary_skill, :password,
                                     :password_confirmation, :designation_id, :role_id, :image, :date_of_birth)
  end
end
