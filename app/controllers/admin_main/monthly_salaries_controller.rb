# frozen_string_literal: true

module AdminMain
  class MonthlySalariesController < ApplicationController
    def index
      @monthly_salaries = MonthlySalary.all.order('month DESC')
    end

    def new
      @monthly_salary = MonthlySalary.new
    end

    def create
      @monthly_salary = MonthlySalary.new(monthly_params)
      if Date.today.month - 1 == monthly_params[:month].to_i
        @monthly_salary.save
        redirect_to admin_main_monthly_salaries_path
      else
        flash[:error] = 'You can create salary only one month ago'
        render :new
      end
    end

    def update
      @monthly_salary = MonthlySalary.find_by_id(params[:id])
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
  end
end
