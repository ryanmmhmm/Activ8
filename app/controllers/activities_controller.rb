class ActivitiesController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]

  def index
    @activities = Activity.all
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)

    if @activity.save
      redirect_to @activity, notice: "#{@activity.title.capitalize} has been Acitv8'd."
    else
      render :new, alert: 'Making your activity has wuba-duba-dub-dubbed... Call Rick.'
    end

  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])

    if @activity.update(activity_params)
      redirect_to @activity, notice: "#{@activity.title.capitalize} was updated."
    else
      render :edit
    end

  end

  def destroy
    if @activity.destroy
      redicret_to :root, notice: 'Your account has be deActiv8\'d'
    elsif @activity.errors.is_true?
      flash.now[:alert] = 'Sorry, you can\'t deActiv8 that.'
      redirect_back_or_to (:activities)
    else
      logout(current_user)
      redirect_to :root, notice: 'Get out, heathen!'
    end

  end

  private
  def activity_params
    params.require(:activity).permit(
      :id,
      :title,
      :description,
      :location,
      :end_time,
      :picture_url,
      :owner_id)
  end
end