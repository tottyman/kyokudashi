class Public::MusicsController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  def new
    @music = Music.new
    @bands = Band.all
    @count = current_user.musics.count
    @admin = Admin.find(1)
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
    @musics = Music.page(params[:page])
  end

  def show
    music = Music.find(params[:id])
    @music = Music.find_by(user_id: music.user_id)
    @musics = Music.where(user_id: music.user_id)
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
      @bands = Band.all
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
