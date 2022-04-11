class DesignationsController < InheritedResources::Base

  private

    def designation_params
      params.require(:designation).permit(:name)
    end

end
