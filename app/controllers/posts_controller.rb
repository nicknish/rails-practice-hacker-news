class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

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
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post, notice: 'Successfully updated record'
    else
      render :edit, notice: 'Please correct the errors.'
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      redirect_to root_path, notice: 'Post deleted.'
    else
      render :show, notice: 'Sorry there'
    end
  end

  private

  def post_params
    params.require(:post).permit(:name, :description).merge(user: current_user)
  end
end
