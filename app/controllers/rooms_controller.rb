class RoomsController < ApplicationController
  def destroy
    @venue = Venue.find(params[:venue_id])
    @room = @venue.rooms.find(params[:id])
    @room.destroy
    redirect_to venue_path(@venue)
  end
end
