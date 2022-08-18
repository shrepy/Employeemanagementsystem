class SkillsController < ApplicationController
  before_action :authenticate_employee!
  private

    def skill_params
      params.require(:skill).permit(:name)
    end

end
