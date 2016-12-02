module UsersHelper
  def attending_events
    my_tickets = Ticket.where(:user_id => current_user.id).select(:event_id).all
    my_events = []
    my_tickets.each do |ticket|
      puts ticket.event_id
      my_events << Event.where(:id => ticket.event_id).first
    end
    return my_events
  end

  def has_ticket?(event)
    !Ticket.where(:event_id => event.id, :user_id => current_user.id).all.blank?
  end

  def hosting_events
    my_events = Event.where(:host_user_id => current_user.id)
    my_hosting_events = []
    my_events.each do |event|
      puts event.title
      my_hosting_events << event
    end
    puts my_events
    return my_events
  end
end
