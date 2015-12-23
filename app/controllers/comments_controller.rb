class CommentsController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]
  before_action :load_activity, except: [:index]

  def index
    @comments = Comment.all.order(created_at: :desc)
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = @activity.comments.new
  end

  def create
    @comment = @activity.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to activity_path(@activity)
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
      redirect_to activity_path(@activity)
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to activity_path(@activity)
    else
      render :show
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:id, :user_id, :activity_id, :body)
  end

  def load_activity
    @activity = Activity.find(params[:activity_id])
  end
end
