class DailyTasksController < ApplicationController

	def index
		if current_employee.role.name == "HR"
			@daily_tasks = DailyTask.all.order(created_at: :desc)
		else
			@daily_tasks = current_employee.daily_tasks.order(created_at: :desc)
		end
	end

	def show 
		if current_employee.role&.name == "HR"
			@daily_task = DailyTask.find(params[:id])
		else
			@daily_task = current_employee.daily_tasks.find(params[:id])
		end
	end

	def new
		task = current_employee.daily_tasks.map{ |task| task if task.created_at.to_date == Time.now.to_date}.compact 
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
		@daily_task = current_employee.daily_tasks.where("EXTRACT(DAY FROM created_at) = ?", Date.current.day).first
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

	def params_daily_task
		params.require(:daily_task).permit(:description,:employee_id)
	end
end

