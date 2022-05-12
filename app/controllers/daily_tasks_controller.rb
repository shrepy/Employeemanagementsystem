# frozen_string_literal: true

# dailytaskscontroller
class DailyTasksController < ApplicationController
  def index
    @daily_tasks = current_employee.daily_tasks.order(created_at: :desc)
  end

  def show
    @daily_task = if current_employee.is_hr?
                    DailyTask.find_by_id(params[:id])
                  else
                    current_user.daily_tasks.find_by_id(params[:id])
                  end
    redirect_to daily_tasks_path if @daily_task.nil?
  end

  def new
    task = current_employee.daily_tasks.map { |t| t if t.created_at.to_date == Time.now.to_date }.compact
    if task.blank?
      @daily_task = DailyTask.new
    else
      redirect_to edit_daily_task_path(task)
    end
  end

  def create
    @daily_task = DailyTask.new(params_daily_task)
    if @daily_task.save
      redirect_to daily_tasks_path
    else
      render :new
    end
  end

  def edit
    @daily_task = current_employee.daily_tasks.last
    # @@daily_task = DailyTask.find(params[:id])
  end

  def update
    @daily_task = DailyTask.find(params[:id])
    if @daily_task.update(params_daily_task)
      redirect_to @daily_task
    else
      render :edit
    end
  end

  private

  def params_daily_task
    params.require(:daily_task).permit(:description, :employee_id)
  end
end
