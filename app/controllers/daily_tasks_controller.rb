# frozen_string_literal: true

class DailyTasksController < ApplicationController
  before_action :set_daily_task, only: %i[show]
  def index
    @daily_tasks = if current_employee.is_hr?
                     DailyTask.all.order(created_at: :desc).page params[:page]
                   else
                     current_employee.daily_tasks.order(created_at: :desc).page params[:page]
                   end
  end

  def show
    @daily_task = if current_employee.is_hr?
                    DailyTask.find_by_id params[:id]
                  else
                    @daily_task = current_employee.daily_tasks.find_by_id params[:id]
                    render json: { message: 'You Have Not Access :)' }, status: 404 unless @daily_task.present?
                  end
  end

  def new
    task = current_employee.daily_tasks.map { |task| task if task.created_at.to_date == Time.now.to_date }.compact
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
    @daily_task = current_employee.daily_tasks.where('EXTRACT(DAY FROM created_at) = ?', Date.current.day).first
    if @daily_task.present?
      render :edit
    else
      redirect_to daily_tasks_path
    end
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

  def set_daily_task
    @daily_task =  DailyTask.find_by_id params[:id]
    render json: { message: 'Not Found' }, status: 404 unless @daily_task.present?
  end

  def params_daily_task
    params.require(:daily_task).permit(:description, :employee_id)
  end
end
