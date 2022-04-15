# frozen_string_literal: true

# performance controller
class PerformancesController < InheritedResources::Base
  before_action :authenticate_employee!
  load_and_authorize_resource
  def index
    @performances = Performance.all
  end

  private

  def performance_params
    params.require(:performance).permit(:points, :month, :from, :to, :employee_id)
  end
end
