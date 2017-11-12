class PhotosController < ApplicationController
  
  # 定義執行action前必需執行的方法，可限制特定action
  before_action :set_photo, :only => [:show,:edit,:update,:destroy]


  def index
    @photos = Photo.all # a讀取所有資料
  end

  def new
    @photo = Photo.new # a產生新的頁面
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to photos_url
    else
      render :action => :new
    end
  end

  def show
    # # @photo = Photo.find(params[:id])
    # set_photo
  end

  def edit
    # # @photo = Photo.find (params[:id])
    # set_photo
  end
  
  def update
    # # @photo = Photo.find (params[:id])
    # set_photo
    if @photo.update_attributes(photo_params)
      redirect_to photo_path(@photo)
    else
      render :action => :edit
    end
  end

  def destroy
    # # @photo = Photo.find(params[:id])
    # set_photo
    @photo.destroy

    redirect_to photos_url
  end

  private

  # a定義接受view傳來的資料欄位（類似於ViewMode）
  def photo_params
    params.require(:photo).permit(:title,:date,:description,:file_location)
  end

  # 將重覆的程式碼取出
  def set_photo
    @photo = Photo.find(params[:id])
  end

end
