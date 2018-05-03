class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @event = Event.new
    @events = Event.where(creator_id: @user.id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def user_params
      params.require(:user).permit(:name)
  end
end