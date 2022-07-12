# frozen_string_literal: true

module TicketsHelper
  def admin_status(ticket)
    case ticket.status
    when 'accept'
      accept = 'Accepted'
    when 'decline'
      decline = 'Declined'
    else
      accept = link_to 'Accept', admin_main_ticket_path(ticket, status: 'accept'), method: :patch,
                                                                                   class: 'btn btn-success'
      decline = link_to 'Decline', admin_main_ticket_path(ticket, status: 'decline'), method: :patch,
                                                                                      class: 'btn btn-danger'
    end
    [accept, decline]
  end

  def accept_decline(ticket)
    if ticket.status.nil?
      Pending
    elsif ticket.status == 'accept'
      Accepted
    else
      Rejected
    end
  end
end
