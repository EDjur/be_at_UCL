module UsersHelper
  def attending_events

    my_tickets = Ticket.where(["user_id = ?", current_user.id]).select("event_id").all
    my_events = []
    my_tickets.each do |ticket|
      puts ticket.event_id
      my_events << Event.where(["id = ?", ticket.event_id]).first
    end
    return my_events
  end

  def has_ticket?(event)
    !(Ticket.where(["event_id = ?", event.id]).select("event_id").all).nil?
  end
end
