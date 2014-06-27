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

  def create
    # we do not use this next line in development
    # raise params[:user].inspect
    @user = User.new(params[:id])
    
    if @user.save
      redirect_to @user, :flash => { :success => "Welcome to the Sample App!"}
    else
      @title = "Sign up"
      render 'new'
    end
  end
end