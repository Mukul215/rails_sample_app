class UsersController < ApplicationController
  def new
  	@title = "Sign up"
  end

  def show
    # this is how to find the user dynamically
    @user = User.find(params[:id])
  end
end