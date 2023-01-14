class Public::MusicsController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  def new
    @music = Music.new
    @bands = Band.all
    @count = current_user.musics.count
  end

  def create
    @music = Music.new(music_params)
    @music.user_id = current_user.id
    if @music.save
      redirect_to musics_path
    else
      render :new
    end
  end

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

  def update
    @music = Music.find(params[:id])
    if @music.update(music_params)
      redirect_to music_path(@music)
    else
      render :edit
    end
  end

  def destroy
    @music = Music.find(params[:id])
    @music.destroy
    redirect_to new_music_path
  end

  private

  def music_params
    params.require(:music).permit(:user_id, :band_id, :music_name, :music_time, :status)
  end

end
