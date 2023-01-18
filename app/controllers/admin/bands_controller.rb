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
    @band.linenumber = Band.count + 1
    if @band.save
      redirect_to admin_bands_path
    else
      @bands = Band.all
      render :index
    end
  end

  def change_up
    @band = Band.find(params[:id])
    @before_band = Band.where("linenumber < ?", @band.linenumber).order("linenumber desc").first(1)
      @before_band.each do |band|
        @before_linenumber = @band.linenumber
        @target_linenumber = band.linenumber
        band.linenumber = @before_linenumber
        @band.linenumber = @target_linenumber
        @band.update(band_linenumber_params)
        band.update(band_linenumber_params)
      end
    redirect_to timetable_admin_musics_path
  end
  
  def change_down
    @band = Band.find(params[:id])
    @before_band = Band.where("linenumber > ?", @band.linenumber).order("linenumber").first(1)
      @before_band.each do |band|
        @before_linenumber = @band.linenumber
        @target_linenumber = band.linenumber
        band.linenumber = @before_linenumber
        @band.linenumber = @target_linenumber
        @band.update(band_linenumber_params)
        band.update(band_linenumber_params)
      end
    redirect_to timetable_admin_musics_path
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
    params.require(:band).permit(:band_name, :mike_number, :other, :linenumber)
  end

   def band_linenumber_params
    params.permit(:linenumber)
  end

end
