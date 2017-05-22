class PicturesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pictures, only: [:edit, :update, :destroy]

  def index
    @pictures = Picture.order(:created_at).reverse_order
  end

  def new
    if params[:back]
      @pictures = Picture.new(pictures_params)
    else
      @pictures = Picture.new
    end
  end

  def edit
  end

  def update
    if @pictures.update(pictures_params)
      redirect_to pictures_path, success: "更新しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @pictures.destroy
    redirect_to pictures_path, success: "削除しました！"
  end

  def create
    @pictures = Picture.create(pictures_params)
    @pictures.user_id = current_user.id
    if @pictures.save
      redirect_to pictures_path, success: "アップロードされました！"
      NoticeMailer.sendmail_picture(@pictures).deliver
    else
      render 'new'
    end
  end

  def confirm
    @pictures = Picture.new(pictures_params)
    render :new if @pictures.invalid?
  end

  private
    def pictures_params
      params.require(:picture).permit(:comment, :image, :image_cache)
    end

    def set_pictures
      @pictures = Picture.find(params[:id])
    end
end
