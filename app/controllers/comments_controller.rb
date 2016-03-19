class CommentsController < ApplicationController

  before_action :require_sign_in

  before_action :authorize_user, only: [:destroy]

  def create
    @post = Post.find_by(id: params[:post_id])
    @topic = Topic.find_by(id: params[:topic_id])

    if @post
      comment = @post.comments.new(comment_params)
    else
      comment = @topic.comments.new(comment_params)
    end
    comment.user = current_user

    if comment.save
      flash[:notice] = "Comment saved successfully."
    else
      flash[:alert] = "Comment failed to save."
    end
    if @post
      redirect_to [@post.topic, @post]
    else
      redirect_to @topic
    end
  end

  def destroy
    @post = Post.find_by(id: params[:post_id])
    @topic = Topic.find_by(id: params[:topic_id])

    if @post
      comment = @post.comments.find_by(id: params[:id])
    else
      comment = @topic.comments.find_by(id: params[:id])
    end

    if comment.destroy
      flash[:notice] = "Comment was deleted."
    else
      flash[:alert] = "Comment couldn't be deleted. Try again."
    end
    if @post
      redirect_to [@post.topic, @post]
    else
      redirect_to @topic
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def authorize_user
    comment = Comment.find(params[:id])
    unless current_user == comment.user || current_user.admin?
      flash[:alert] = "You do not have permission to delete a comment."
      redirect_to [comment.post.topic, comment.post]
    end
  end
end
