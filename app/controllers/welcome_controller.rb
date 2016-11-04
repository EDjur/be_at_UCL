class WelcomeController < ApplicationController
  def index
    # TODO: Maybe add if-statements here to check if user is already logged in. In the future.
    @user = User.new
  end
end
