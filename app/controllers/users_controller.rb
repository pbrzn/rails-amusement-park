class UsersController < ApplicationController
  helper_method :logged_in?

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to root_path
    end
  end

  def show
    if !!logged_in?
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end

  # def edit
  #   @user = User.find(params[:id])
  # end
  #
  # def update
  #   @user = User.find(params[:id])
  #   if !params[:attraction_id].nil?
  #     ride = @user.rides.build(attraction_id: params[:attraction_id])
  #     ride.take_ride
  #     @user.save
  #     redirect_to user_path(@user)
  #   end
  # end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :height, :tickets, :nausea, :happiness, :admin)
  end

  def logged_in?
    true if !session[:user_id].nil?
  end
end
