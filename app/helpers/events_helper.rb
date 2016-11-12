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
end
