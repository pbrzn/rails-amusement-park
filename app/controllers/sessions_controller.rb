class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(id: params[:id])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    elsif session[:user_id].nil?
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
