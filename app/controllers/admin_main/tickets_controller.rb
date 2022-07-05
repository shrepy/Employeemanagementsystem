# frozen_string_literal: true

module AdminMain
  class TicketsController < ApplicationController
    before_action :set_ticket, only: %i[show update]

    def index
      @tickets = Ticket.search(params[:search]).order('created_at desc').page(params[:page])
    end

    def show; end

    def update
      @ticket.update(status: params[:status])
      redirect_to admin_main_tickets_path
    end

    private

    def set_ticket
      @ticket = Ticket.find_by_id params[:id]
      redirect_to root_path, { notice: 'NOT FOUND :)' } unless @ticket.present?
    end
  end
end
