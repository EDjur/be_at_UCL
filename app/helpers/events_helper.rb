module EventsHelper

  def tickets_left?
    unless @event.available_tickets.nil?
      @event.available_tickets > 0
    end
  end

  def time_surpassed?
    !@event.end_date.to_date.past?
  end
end
