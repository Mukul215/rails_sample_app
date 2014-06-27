class UsersController < ApplicationController
  def new
  	@title = "Sign up"
    @user = User.new
  end

  def show
    # this is how to find the user dynamically
    @user = User.find(params[:id])
    @title = @user.name
  end
end