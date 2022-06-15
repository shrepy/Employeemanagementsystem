class AdminMain::TicketsController < ApplicationController

    def index 
	    if current_user.role.name == 'Admin'
	      @tickets = Ticket.order(created_at: :desc)
	    else
	      @tickets = Ticket.where(employee_id: current_employee)
	    end
    end
  
    def show
    	@ticket = Ticket.find_by_id params[:id]
        @employee = Employee.all 
    end

    def update
	  	@ticket = Ticket.find(params[:id])
	  	@employee = Employee.all
	    @ticket.update(status: 'accept', updated_by: current_employee.name)
	    redirect_to admin_main_tickets_path
    end
  
    def decline_tickett
    @ticket = Ticket.find(params[:id])
    if @ticket.status.nil?
      if @ticket.update(status: 'decline', updated_by: current_employee.name)
        redirect_to admin_main_tickets_path
      else 
        render :index
      end
    else
      redirect_to  admin_main_tickets_path
    end
  end
end
