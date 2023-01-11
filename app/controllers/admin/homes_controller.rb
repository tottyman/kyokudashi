class Admin::HomesController < ApplicationController

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
    redirect_to admin_top_path
  end

  private

  def admin_params
    params.require(:admin).permit(:event_date, :deadline)
  end

end
