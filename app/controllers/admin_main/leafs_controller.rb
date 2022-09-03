# frozen_string_literal: true

module AdminMain
  class LeafsController < ApplicationController
    before_action :set_leaves, only: %i[update]
    def index
      @leafs = Leaf.where(employee_id: params[:employee_id]).order('created_at DESC') 
    end
  end
end
