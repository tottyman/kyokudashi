class Admin::MembersController < ApplicationController
  
  def create
    @member = Member.new(member_params)
    @band = Band.find(params[:band_id])
    @member.band_id = @band.id

    if Member.where(user_id: @member.user_id, band_id: @band.id).count == 0
      @member.save
      redirect_to admin_band_path(@band)
    else
      redirect_to admin_band_path(@band)
    end
  end

  def destroy
    @member = Member.find_by(user_id: params[:user_id] ,band_id: params[:band_id])
    @member.destroy
    redirect_to admin_band_path(@member.band_id)
  end

  private

  def member_params
    params.require(:member).permit(:band_id, :user_id)
  end
  
end
