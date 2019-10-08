class PostsController < ApplicationController
  before_action :require_login
  
  def new
    @post = Post.new
    @post.sub_id = params[:sub_id]
    # @post.user_id = current_user.id
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = params[:user_id]
    @post.sub_id = params[:hidden][:sub_id]
    if @post.save
      redirect_to sub_post_url(@post.sub_id, @post.id)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def edit
    @post = current_user.posts.find(params[:id])
    if @post
      render :edit
    else
      flash[:errors] = "Post not found"
      redirect_to sub_post_url(params[:sub_id], params[:id])
    end
  end

  def update
    @post = current_user.posts.find(params[:id])
    @post.update(post_params)
    flash[:errors] = @post.errors.full_messages
    redirect_to sub_post_url(@post)
  end

  private
  
  def post_params
    params.require(:post).permit(:title, :url, :content, :sub_id)
  end
end