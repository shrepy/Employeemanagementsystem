# frozen_string_literal: true

# Employee controller
class EmployeesController < ApplicationController
  before_action :authenticate_employee!
  before_action :set_employee, only: %i[show edit update destroy]

  # GET /employees or /employees.json
  def index
    @employees = Employee.all
  end

  # GET /employees/1 or /employees/1.json
  def show; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_employee
    @employee = Employee.find_by_id params[:id]
    render :show, notice: 'jsbdfjeb', status: 404 unless @employee.present?
  end
  
end
