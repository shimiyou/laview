class AlbumsController < ApplicationController
  def index
    @albums = Album.page(params[:page]).per(6)
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.create(album_params)
    if @album.save
      redirect_to new_album_post_path(@album.id)
    else
      flash.now[:alert] = 'アルバム名を入力してください'
      render :new
    end
  end

  def show
    @album = Album.find(params[:id])
    @posts = @album.posts.page(params[:page]).per(4)
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to root_path
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to album_path(@album.id)
    else
      flash.now[:alert] = 'アルバム名を入力してください'
      render :edit
    end
  end

  private
  def album_params
    params.require(:album).permit(:name)
  end
end
