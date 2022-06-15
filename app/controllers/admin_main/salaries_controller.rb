class AdminMain::SalariesController < ApplicationController

   def index
	 @salaries = Salary.all
	end

  def show
    @salarie = Salary.find_by_id params[:id]
    @employee = Employee.all 
  end

  def new
    # byebug
      @salarie = Salary.new
  end

  def create
    # byebug
   @employee = Employee.all 
   	@salarie = Salary.new(salarie_params)
  	if @salarie.save
  		redirect_to admin_main_salaries_path
  	else
  	  render :new
  	end
  end

  def edit
    @salarie = Salary.find(params[:id])
  end

  def update
    @salarie = Salary.find(params[:id])

    if @salarie.update(salarie_params)
      redirect_to @salarie
    else
      render :edit
    end
  end

  def destroy
    @salarie = Salary.find(params[:id])
    @salarie.destroy
  end

  private

  def salarie_params

    params.require(:salary).permit(:salary, :month, :employee_id,:leaves, :earnings, :deductions, :total_working_days)
  end
end
