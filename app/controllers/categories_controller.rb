class CategoriesController < ApplicationController
  before_action :load_association
  skip_before_action :require_login, only: [:show]

  def new
    @category = Category.new
  end

  def create
    @association.category = Category.new(category_params)
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(category_params[:id])
    if @category.update
      redirect_to @association, notice: "You have successfully added your selected Categories."
    else
      render :edit
    end
  end

  private
  def load_association
    @category = Category.find(params[:id])

    if @category.activity != nil
      @association = @category.activity
    else
      @association = @category.user
    end
  end

  def category_params
    params.require(:category).permit(
      :id,
      :activity_id,
      :user_id,
      :athletic,
      :sporting_event,
      :night_life,
      :general,
      :other,
      :random,
      :food,
      :drink,
      :music,
      :game,
      :information,
      :art,
      :technology,
      :deal)
  end
end
