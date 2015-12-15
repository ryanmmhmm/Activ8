class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create, :destroy]

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to(:users, notice: 'Login Successful')
    else
      flash.now[:alert] = 'Login Failed'
      render :new
    end
  end

  def destroy
    logout
    redirect_to(:users, notice: 'Logged out.  Thanks for using Activ8!')
  end
end
