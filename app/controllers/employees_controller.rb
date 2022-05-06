# frozen_string_literal: true

# Employee controller
class EmployeesController < ApplicationController
  include ApplicationHelper
  before_action :authenticate_employee!
  load_and_authorize_resource
  #before_action :set_employee, only: %i[show, edit]

  # GET /employees or /employees.json
  def index
    @employees = Employee.search(params[:search])
    @designations = Designation.all
  end

  # GET /employees/1 or /employees/1.json
  def show
    if employee_role
      @employee = Employee.find(params[:id])
    else
      @employee = current_user
    end
  end

  def edit 
    @designations = Designation.all 
    @skills = Skill.all
    @roles = Role.all
  end

  def update
    @designations = Designation.all 
    @skills = Skill.all
    @roles = Role.all
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      redirect_to @employee
    else
      #render js: edit, status: :unprocessable_entity
      #render json: :edit
      render :edit
    end
  end


  def profile
    @employee = Employee.all
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_employee
    @employee = Employee.find(params[:id])
    render :show, notice: 'Employee not found', status: 404 unless @employee.present?
  end

  def employee_params
     params.require(:employee).permit(:name, :father_name, :mother_name, :phone_number, :address, :email, :bank_name, :account_number, :pan_card_number, :aadhar_card_number,:primary_skill, :password, :password_confirmation, :designation_id, :role_id, :image, :date_of_birth)
  end
end

