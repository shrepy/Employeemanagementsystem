class AdminMain::CommentsController < ApplicationController

	def create
		@ticket = Ticket.all
	    @ticket = Ticket.find_by_id params[:ticket_id]
	    @comment = Comment.new( commenter: params[:commenter], ticket_id: params[:ticket_id])
	     @comment.save
	       redirect_to admin_main_ticket_path(@ticket)
	end
end
