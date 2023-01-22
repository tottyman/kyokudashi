class Admin::HomesController < ApplicationController

  before_action :authenticate_admin!

  def top
    @admin = Admin.find(1)
  end

  def update
    @admin = Admin.find(1)
    @admin.update(admin_params)
    redirect_to admin_top_path
  end

  def destroy
    Music.destroy_all
    Band.destroy_all
    redirect_to admin_musics_path
  end

  private

  def admin_params
    params.require(:admin).permit(:event_date, :deadline, :start_time, :finish_time, :conversion_time, :status)
  end

end
