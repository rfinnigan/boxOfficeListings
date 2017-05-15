class ShowsController < ApplicationController
  def new
    @room = Room.find(params[:room_id])
    @show = Show.new
  end

  def create
      @room = Room.find(params[:room_id])
      @show = @room.shows.create(show_params)
      redirect_to venue_path( id: @room.venue_id)
  end

  private

  def show_params
      params.require(:show).permit(:artist, :title)
  end
end
