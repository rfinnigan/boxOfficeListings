class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
  end

  def new
    @venue = Venue.find(params[:venue_id])
    @room = Room.new
  end

  def create
    @venue = Venue.find(params[:venue_id])
    @room = @venue.rooms.create(room_params)
    redirect_to venue_path(@venue)
  end

  def destroy
    @venue = Venue.find(params[:venue_id])
    @room = @venue.rooms.find(params[:id])
    @room.destroy
    redirect_to venue_path(@venue)
  end

  private

  def room_params
    params.require(:room).permit(:roomName)
  end
end
