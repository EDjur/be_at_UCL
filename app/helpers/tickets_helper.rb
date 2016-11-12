module TicketsHelper
  def attending_guests(event)
    attending_tickets = Ticket.where(:event_id => event.id).select(:user_id).all
    puts attending_tickets
    my_attending_users = []
    attending_tickets.each do |ticket|
      puts ticket.user_id
      my_attending_users << User.where(:id => ticket.user_id).first
    end
    return my_attending_users
  end
end
