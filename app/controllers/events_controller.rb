class EventsController < ApplicationController

  # For basic authentication
  # http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def index
    # @events = Event.all

    # Relict from search by date
    # @search = Event.new(params[:search])
    # @events = @search.scope

    if params[:search]
      @events = Event.search(params[:search]).order("created_at DESC")
    else
      @events = Event.all.order('created_at DESC')
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)
    if logged_in?
      @event.host_user_id = current_user.id
    end
    @event.tickets_sold = 0
    if @event.save # returns false if invalid
      redirect_to @event
    else
      render 'new'
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params) # It is not necessary to pass all the attributes to update. For example, if @article.update(title: 'A new title') was called, Rails would only update the title attribute, leaving all other attributes untouched.
      redirect_to @event
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to events_path
  end

  private
  def event_params
    params.require(:event).permit(:title, :text, :street, :street_number, :city, :start_date, :end_date, :available_tickets, :start_time, :end_time, :category, :user_id)
  end
end
