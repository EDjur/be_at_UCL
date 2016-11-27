module EventsHelper

  def tickets_left?
    unless @event.available_tickets.nil?
      @event.available_tickets > 0
    end
  end

  def time_surpassed?
    !@event.end_date.to_date.past?
  end

  def is_host?
    @event.host_user_id == current_user.id
  end

  def progress_bar_width(event)
    ((event.tickets_sold / (event.available_tickets + event.tickets_sold))*100).round(1)
  end

  def send_emails_if_event_near

    my_tickets = Ticket.where(:user_id => current_user.id).select(:event_id).all
    my_events = []
    my_tickets.each do |ticket|
      puts ticket.event_id
      my_events << Event.where(:id => ticket.event_id).first
    end

    if my_events[0].start_date.to_date == DateTime.now.to_date-2

      puts "hello"

    end


    # Sends email to user when user is created.
    puts "Background task is running!"

    user = @user.current_user

    respond_to do |format|

      ExampleMailer.sample_email(user).deliver_now
      format.html { redirect_to user }
      format.json { render :show, status: :created, location: @user }

    end

  end

end
