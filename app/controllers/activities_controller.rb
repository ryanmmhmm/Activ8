class ActivitiesController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]

  def index

    if params[:search]
      @activities = Activity.near(params[:search])
      populate_map(@activities)
    elsif params[:latitude] && params[:longitude]
      @activities = Activity.near([params[:latitude], params[:longitude]])
      populate_map(@activities)
    else
      @activities = Activity.all
      populate_map(@activities)
    end

    @latitude = params[:latitude]
    @longitude = params[:longitude]
    if request.xhr?
      render partial: 'location', collection: @activities, locals: {latitude: params[:latitude], longitude: params[:longitude]}
    end
  end

  def show
    @activity = Activity.find(params[:id])
    @owner = @activity.owner
    @comments = @activity.comments.order(created_at: :desc)
    @nearby_activities = @activity.nearbys(10, :units => :km)

    populate_map(@activity)
    populate_map(@nearby_activities)
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.owner = current_user

    if @activity.save
      redirect_to @activity, notice: "#{@activity.title.capitalize} has been Activated."
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
    @activity = Activity.find(params[:id])

    if @activity.destroy
      redirect_to :root, notice: 'Your Activity has be De-Activated'
    elsif @activity.errors.is_true?
      flash.now[:alert] = 'Sorry, you can\'t deActivated that.'
      redirect_back_or_to (:activities)
    else
      logout(current_user)
      redirect_to :root, alert: 'Get out, heathen!'
    end

  end

  private
  def activity_params
    params.require(:activity).permit(
      :search,
      :id,
      :title,
      :description,
      :location,
      :end_time,
      :picture_url,
      :owner_id)
  end

  def populate_map(activities)
    @hash = Gmaps4rails.build_markers(activities) do |activity, marker|
      marker.lat(activity.latitude)
      marker.lng(activity.longitude)
      marker.infowindow "<b><a href='#{activity_path(activity)}'>#{activity.title}<a></b><br> Descpription: #{activity.description}<br> Address: #{activity.location}"
    end
  end

end
