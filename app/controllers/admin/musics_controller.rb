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
    params.require(:music).permit(:user_id, :song1_name, :song1_time, :song2_name, :song2_time, :band_name, :mike_number, :status, :other)
  end

end
