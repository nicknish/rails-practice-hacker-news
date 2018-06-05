class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :ensure_post_author, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: 'Post successfully created.'
    else
      render :new, notice: 'Please correct the errors below.'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Successfully updated record'
    else
      render :edit, notice: 'Please correct the errors.'
    end
  end

  def destroy
    if @post.destroy
      redirect_to root_path, notice: 'Post deleted.'
    else
      render :show, notice: 'Sorry there'
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def ensure_post_author
    if current_user != @post.user
      redirect_to root_path, flash: { error: 'You must be the owner of this post to edit or delete it.' }
    end
  end

  def post_params
    params.require(:post).permit(:name, :description).merge(user: current_user)
  end
end
