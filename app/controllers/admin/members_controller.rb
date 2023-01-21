class Admin::MembersController < ApplicationController
  
  def create
    member = Member.new(member_params)
    @band = Band.find(params[:band_id])
    member.band_id = @band.id

    if Member.where(user_id: member.user_id, band_id: @band.id).count == 0
      member.save
    else
    end
  end

  def destroy
    @band = Band.find(params[:band_id])
    member = Member.find_by(user_id: params[:id] ,band_id: params[:band_id])
    member.destroy
  end

  private

  def member_params
    params.require(:member).permit(:band_id, :user_id)
  end
  
end
