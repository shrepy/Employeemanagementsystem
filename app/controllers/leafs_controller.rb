class LeafsController < InheritedResources::Base
  before_action :authenticate_employee!
  before_action :set_leaf, only: [:show]
  def index
    if current_employee.role.name == "HR"
      @leafs = Leaf.order('created_at DESC')
    else
      @leafs = Leaf.where(employee_id: current_employee.id).order('created_at DESC')
    end
  end

  def show
    redirect_to leafs_path
  end

  def create
    @leaf = Leaf.new(leaf_params)
    if @leaf.save 
      redirect_to leafs_path
    else
      render new_leaf_path
    end
  end

  def update
     @leaf = Leaf.find(params[:id])
      if @leaf.from_date > Time.now
        if @leaf.update(leave_status: 'cancelled')
          redirect_to leafs_path
        else
          render :index
        end
      else
         redirect_to leafs_path
      end
  end

  private
    def set_leaf
      @leaf =  Leaf.find_by_id params[:id]
      redirect_to root_path, alert: I18n.t('employee.not_found') unless @leaf.present?
    end

    def leaf_params
      params.require(:leaf).permit(:leave_type, :from_date, :till_date, :leave_starts, :leave_end, :total_days, :reason, :leave_status, :employee_id)
    end

end

