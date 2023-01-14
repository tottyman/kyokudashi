class Admin::BandsController < ApplicationController
  
  before_action :authenticate_admin!
  
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
    @band = Band.new(band_params)
    if @band.save
      redirect_to admin_bands_path
    else
      @bands = Band.all
      render :index
    end
  end

  def update
     @band = Band.find(params[:id])
    if @band.update(band_params)
      redirect_to admin_band_path(@band)
    else
      render :edit
    end
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy
    redirect_to admin_bands_path
  end


  private

  def band_params
    params.require(:band).permit(:band_name, :mike_number, :other)
  end
  
end
