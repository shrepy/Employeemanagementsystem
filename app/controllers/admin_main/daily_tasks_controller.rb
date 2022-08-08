# frozen_string_literal: true

module AdminMain
  class DailyTasksController < ApplicationController
    before_action :set_daily_task, only: %i[show]
    def index
      @daily_tasks = DailyTask.all.order(created_at: :desc).page params[:page]
      @daily_task = DailyTask.search(params[:dailytask])
      @employees = Employee.all
    end

    def show
      @daily_task = DailyTask.find_by_id params[:id]
    end

    def pending_daily_task
      daily_tasks = Employee.all.map{|emp| emp.daily_tasks.last }.compact
      @employees = daily_tasks.map{|daily_task| {daily_task.employee.name => (Date.today - daily_task.created_at.to_date).to_i}}
    end
    private

    def set_daily_task
      @daily_task = DailyTask.find_by_id params[:id]
      redirect_to root_path, { notice: 'NOT FOUND :)' } unless @daily_task.present?
    end

    def params_daily_task
      params.require(:daily_task).permit(:description, :employee_id)
    end
  end
end
