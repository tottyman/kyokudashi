class Admin::MusicsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @musics = Music.all
  end

  def show
    @music = Music.find(params[:id])
  end

  def edit
    @music = Music.find(params[:id])
    @bands = Band.all
  end

  def timetable
    @bands = Band.order("linenumber")
    @admin = Admin.find(1)
    @admintime = @admin.start_time
    @conversion_time = @admin.conversion_time*60
  end



  def update
    @music = Music.find(params[:id])
    if @music.update(music_params)
      redirect_to admin_music_path(@music)
    else
      render :edit
    end
  end

  def destroy
    @music = Music.find(params[:id])
    @music.destroy
    redirect_to admin_musics_path
  end

  private

  def music_params
    params.require(:music).permit(:user_id, :band_id, :music_name, :music_time, :status)
  end

end
