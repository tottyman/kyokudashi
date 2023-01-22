class Public::BandsController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  def index
    @band = Band.new
    @bands = Band.all
  end

  def show
    @band = Band.find(params[:id])
    @member = @band.members.new
    @users = User.all
  end

  def edit
    @band = Band.find(params[:id])
  end

  def create
    @bands = Band.all
    @band = Band.new(band_params)
    @band.linenumber = Band.count + 1
    if Band.where(band_name: @band.band_name).count == 0
      if @band.save
        redirect_to bands_path
      else
        render :index
      end
    else
      flash[:name] = "既にバンドが存在しています。"
      render :index
    end
  end

  def update
     @band = Band.find(params[:id])
    if @band.update(band_params)
      redirect_to band_path(@band)
    else
      render :edit
    end
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy
    redirect_to bands_path
  end


  private

  def band_params
    params.require(:band).permit(:band_name, :mike_number, :other, :linenumber)
  end

end
