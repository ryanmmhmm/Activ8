class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create, :destroy]

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to(:activities, notice: 'Login Successful.')
    else
      flash.now[:alert] = 'Login Failed. Please try again.'
      render :new
    end
  end

  def destroy
    logout
    redirect_to(:activities, notice: 'Logged out.  Thanks for using Activate!')
  end
end
