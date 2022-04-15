class DesignationsController < InheritedResources::Base
  before_action :authenticate_employee!
  load_and_authorize_resource
  private

    def designation_params
      params.require(:designation).permit(:name)
    end

end
