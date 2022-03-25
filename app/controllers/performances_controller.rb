class PerformancesController < InheritedResources::Base
  def index
    @performances = Performance.all
  end
  private

    def performance_params
      params.require(:performance).permit(:points, :month, :from, :to, :employee_id)
    end

end
