class CommentsController < ApplicationController
  before_action :set_post, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_comment, only: [:edit, :update, :destroy]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params.merge(post_id: @post.id))

    if @comment.save
      redirect_to @post, notice: 'Comment successfully posted.'
    else
      render :new, error: 'Sorry, there was an error saving your comment.'
    end
  end

  def edit; end

  def update
    if @comment.update(comment_params)
      redirect_to @post, notice: 'Comment updated.'
    else
      render :edit, error: 'Sorry, there was an error saving your comment.'
    end
  end

  def destroy
    if @comment.destroy
      redirect_back fallback_location: root_path
    else
      redirect_back fallback_location: root_path, error: 'Sorry, there was a problem deleting your comment.'
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:comment_body).merge(user_id: current_user.id)
  end
end
