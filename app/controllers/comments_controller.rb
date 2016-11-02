class CommentsController < ApplicationController

  # For basic authentication
  # http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

  def create
    @event = Event.find(params[:event_id])
    @comment = @event.comments.create(comment_params)
    redirect_to event_path(@event)
  end

  def destroy
    @event = Event.find(params[:event_id])
    @comment = @event.comments.find(params[:id])
    @comment.destroy
    redirect_to event_path(@event)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
