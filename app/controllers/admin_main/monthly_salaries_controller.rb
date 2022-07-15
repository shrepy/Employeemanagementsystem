# frozen_string_literal: true

module AdminMain
  class MonthlySalariesController < ApplicationController
    before_action :set_monthly_salary, only: %i[update show]

    def index
      @monthly_salaries = MonthlySalary.all.order('month DESC')
    end

    def new
      @monthly_salary = MonthlySalary.new
    end

    def show; end

    def create
      @monthly_salary = MonthlySalary.new(monthly_params)
      if @monthly_salary.save
        redirect_to admin_main_monthly_salaries_path
      else
        render :new
      end
    end

    def update
      if @monthly_salary.update(company_level: params[:company_level])
        redirect_to admin_main_monthly_salaries_path
      else
        render :edit
      end
    end

    private

    def monthly_params
      params.require(:monthly_salary).permit(:month, :monthly_working_days, :company_level)
    end

    def set_monthly_salary
      @monthly_salary = MonthlySalary.find_by_id(params[:id])
      redirect_to root_path, { notice: 'NOT FOUND' } unless @monthly_salary.present?
    end
  end
end
