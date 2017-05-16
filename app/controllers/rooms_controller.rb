# controller class for room model
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
    @room = Room.find(params[:id])
    @venue = Venue.find(@room[:venue_id])
    @room.destroy
    redirect_to venue_path(@venue)
  end

  private

  # method for settting venue from passed venue_id param
  # when using shallow nesting this will only work when called
  # from index, new and create
  def set_venue
    @venue = Venue.find(params[:venue_id])
  end

  def room_params
    params.require(:room).permit(:roomName)
  end
end
