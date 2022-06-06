# frozen_string_literal: true

# dailytaskcontroller
class DailyTasksController < ApplicationController
  before_action :set_daily_task, only: %i[show update edit]
  def index
    @daily_tasks = if current_employee.is_hr?
                     DailyTask.all.order(created_at: :desc).page params[:page]
                   else
                     current_employee.daily_tasks.order(created_at: :desc).page params[:page]
                   end
  end

  def show
    if current_employee.is_hr?
      @daily_task = DailyTask.find_by_id params[:id]
    else
      @daily_task = current_employee.daily_tasks.find_by_id params[:id]

      redirect_to root_path, alert: I18n.t('employee.unauthorize_error') unless @daily_task.present?
    end
  end

  def new
    task = current_employee.daily_tasks.where('EXTRACT(DAY FROM created_at) = ?', Date.current.day).first
    if task.blank?
      @daily_task = DailyTask.new
    else
      redirect_to edit_daily_task_path(task.id)
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
    @daily_task = current_employee.daily_tasks.where('EXTRACT(DAY FROM created_at) = ?', Date.current.day).first
    if @daily_task.present?
      render :edit
    else
      redirect_to daily_tasks_path
    end
  end

  def update
    if @daily_task.update(params_daily_task)
      redirect_to @daily_task
    else
      render :edit
    end
  end

  private

  def set_daily_task
    @daily_task =  DailyTask.find_by_id params[:id]
    redirect_to root_path, alert: I18n.t('employee.not_found') unless @daily_task.present?
  end

  def params_daily_task
    params.require(:daily_task).permit(:description, :employee_id)
  end
end
