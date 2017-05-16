class RoomsController < ApplicationController
  before_action :set_venue, only: [:index, :new, :create]

  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = Room.new
  end

  def edit
    @room = Room.find(params[:id])
  end

  def create
    @room = @venue.rooms.create(room_params)
    redirect_to venue_path(@venue)
  end

  def update
    @room = Room.find(params[:id])

    if @room.update(room_params)
      redirect_to Venue.find(@room[:venue_id])
    else
      render 'edit'
    end
  end

  def destroy
    @room = @venue.rooms.find(params[:id])
    @room.destroy
    redirect_to venue_path(@venue)
  end

  private

  def set_venue
    @venue = Venue.find(params[:venue_id])
  end

  def room_params
    params.require(:room).permit(:roomName)
  end
end
