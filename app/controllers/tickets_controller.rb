class TicketsController < InheritedResources::Base
  def index 
    if current_user.role.name == 'HR'
      @tickets = Ticket.order(created_at: :desc)
    else
      @tickets = Ticket.where(employee_id: current_employee)
    end
  end
  
  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      redirect_to tickets_path
    else
      render :new 
    end
  end

  def update
    @ticket = Ticket.find(params[:id])
    if @ticket.status.nil?
      if @ticket.update(status: 'accept', updated_by: current_employee.name)
        redirect_to tickets_path
      else 
        render :index
      end
    else 
      redirect_to tickets_path
    end
  end

   def decline_ticket
    @ticket = Ticket.find(params[:id])
    if @ticket.status.nil?
      if @ticket.update(status: 'decline', updated_by: current_employee.name)
        redirect_to tickets_path
      else 
        render :index
      end
    else
      redirect_to tickets_path
    end
  end

  private

    def ticket_params
      params.require(:ticket).permit(:status, :description, :ticket_type, :employee_id, :reason)
    end

end
