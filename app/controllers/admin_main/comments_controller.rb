# frozen_string_literal: true

module AdminMain
  class CommentsController < ApplicationController
    def create
      ticket = Ticket.find_by_id params[:ticket_id]
      @comment = ticket.comments.create(description: params[:description], ticket_id: params[:ticket_id],
                                        employee_id: params[:employee_id])
      redirect_to admin_main_ticket_path(ticket)
    end
  end
end
