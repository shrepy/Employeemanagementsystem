class DailyTasksController < ApplicationController

	def index
		@daily_tasks = current_employee.daily_tasks
	end

	def show 
		@daily_task = DailyTask.find(params[:id])
	end

	def new
		@daily_task = DailyTask.new
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
		@daily_task = DailyTask.find(params[:id])
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

