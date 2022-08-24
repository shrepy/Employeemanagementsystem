# frozen_string_literal: true

module AdminMain
  class LeafsController < ApplicationController
    before_action :set_leaves, only: %i[update]
    def index
      @leafs = Leaf.all
    end

    def update
      @leaf.update(leave_status: params[:leave_status])

      redirect_to employees_path
    end

    private

    def set_leaves
      @leaf = Leaf.find_by_id params[:id]
      redirect_to root_path, { notice: 'NOT FOUND :)' } unless @leaf.present?
    end
  end
end
