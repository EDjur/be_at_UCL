class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    # if @user.save # returns false if invalid
    #   log_in @user
    #   redirect_to events_path
    # else
    #   render 'errors'
    # end

    #send email when user registered
    respond_to do |format|
      if @user.save

        log_in @user

        # Sends email to user when user is created.
        ExampleMailer.sample_email(@user).deliver_now

        format.html { redirect_to @user }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render 'errors' }
        format.json { render json: @user.errors }
      end
    end

  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :department)
  end

end
