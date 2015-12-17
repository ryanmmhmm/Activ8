class CommentsController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
    @activity = Activity.find(params[:activity_id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.activity = comment_params[:activity_id]

    if @comment.save
      redirect_to activity_path(@comment.activity)
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(comment_params[:id])

    if (@comment.user == current_user) && (@comment.update(comment_params))
      redirect_to activity_path(@comment.activity)
    else
      render :edit
    end
  end

  def destroy
    if @comment.destroy
      redirect_to activity_path(params[:activity_id])
    else
      render :show
    end
  end

  private
  def comment_params
    params.require(:comment).permit(
      :id,
      :user_id,
      :activity_id,
      :body)
  end
end
