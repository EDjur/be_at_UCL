module UsersHelper
  def attending_events

    my_tickets = Ticket.where(["user_id = ?", current_user.id]).select("event_id").all
    my_events = []
    my_tickets.each do |ticket|
      puts ticket.event_id
      my_events << Event.where(["id = ?", ticket.event_id]).first
    end

    puts my_events
    return my_events
  end
end
