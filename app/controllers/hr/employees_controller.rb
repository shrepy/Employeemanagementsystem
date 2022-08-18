# frozen_string_literal: true

module Hr
  class EmployeesController < ApplicationController
    load_and_authorize_resource

    def index
      redirect_to new_hr_employee_path
    end

    def new
      @employee = Employee.new
      set_designations
    end

    def create
      set_designations
      @employee = Employee.new(employee_params)
      if @employee.save
        redirect_to @employee
      else
        render :new
      end
    end

    def update_leave_balance
      singleton_leave = SingletonLeave.instance
      unless singleton_leave.leave_increment_date == Date.today.beginning_of_month
        leaves = Employee.all
        leaves.each do |leave|
          leave.increment!(:leave_count)
        end
        singleton_leave.update(leave_increment_date: Date.today.beginning_of_month)
      end
      redirect_to root_path
    end

    private

    def set_designations
      @designations = Designation.all 
      @skills = Skill.all
      @roles = Role.all
    end
    
    def employee_params
      params.require(:employee).permit(:designation_id, :role_id, :name, :father_name, :mother_name, :date_of_birth,
                                       :phone_number, :email, :address, :bank_name, :account_number, :pan_card_number, :aadhar_card_number, :primary_skill, :password, :password_confirmation, :joining_date, :gender, :image)
    end
  end
end
