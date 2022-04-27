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
    if @ticket.update(status: 'accept')
      redirect_to tickets_path
    else 
      render :index
    end
  end

   def decline_ticket
    @ticket = Ticket.find(params[:id])
    if @ticket.update(status: 'decline')
      redirect_to tickets_path
    else 
      render :index
    end
  end

  private

    def ticket_params
      params.require(:ticket).permit(:status, :description, :ticket_type, :employee_id)
    end

end
