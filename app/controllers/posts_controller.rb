class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save == false
      flash.now[:alert] = '写真を選択してください'
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to album_path(@post.album_id)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to album_post_path(@post.album_id, @post.id)
    else
      flash.now[:alert] = '写真を選択してください'
      render :edit
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :image, :text).merge(user_id: current_user.id, album_id: params[:album_id])
  end
end
