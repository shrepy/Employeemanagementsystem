module TicketsHelper
  def accept_decline(ticket)
    if current_employee.is_admin?

      case ticket.status
      when 'accept'
        accept = button_tag 'Accepted', class: 'btn btn-success  disabled'
      when 'decline'
       decline = button_tag 'Declined', class: 'btn btn-danger disabled'
      else
        accept = link_to 'Accept', admin_main_ticket_path(ticket, status: 'accept'), method: :patch, class: 'btn btn-success'
        decline = link_to 'Decline', admin_main_ticket_path(ticket, status: 'decline'), method: :patch, class: 'btn btn-danger'
      end
    elsif ticket.status.nil?
      Pending
    elsif ticket.status == 'accept'
      Accepted
    else
      Rejected
    end
    [accept, decline]
  end 
end
