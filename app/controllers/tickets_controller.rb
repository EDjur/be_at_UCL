class TicketsController < ApplicationController

  def index

  end

  def create
    puts "YOLOOOOOOOOOOOOOOO"
    @event = Event.find(params[:event_id])
    @ticket = @event.tickets.create(ticket_params)
    flash[:notice] = "Hooray! Ticket successfully booked."
    redirect_to event_path(@event)
  end

  def update
    @ticket = Ticket.find(params[:id])
    if @ticket.update(ticket_params) # It is not necessary to pass all the attributes to update. For example, if @article.update(title: 'A new title') was called, Rails would only update the title attribute, leaving all other attributes untouched.
      redirect_to events_path #redirect to event instead?
    else
      render 'shared/error_messages'
    end
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy

    redirect_to tickets_path
  end

  private
  def ticket_params
    params.require(:ticket).permit(:user_id, :event_id) #something more?
  end
end
