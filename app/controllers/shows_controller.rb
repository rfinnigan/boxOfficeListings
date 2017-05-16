class ShowsController < ApplicationController
  before_action :set_venue_and_room, only: [:index, :new, :create]

  def new
    @show = Show.new
  end

  def edit
    @show = Show.find(params[:id])
  end

  def create
      @show = @room.shows.create(show_params)
      redirect_to venue_path( id: @room.venue_id)
  end

  def update
    @show = Show.find(params[:id])

    if @show.update(show_params)
      @room = Room.find(@show[:room_id])
      @venue = Venue.find(@room[:venue_id])
      redirect_to @venue
    else
      render 'edit'
    end
  end

  private

  # method for settting venue & room instance variables
  # from passed room_id param
  # when using shallow nesting this will only work when called
  # from index, new and create as only these receive this param
  def set_venue_and_room
    @room = Room.find(params[:room_id])
    @venue = Venue.find(@room[:venue_id])
  end

  def show_params
      params.require(:show).permit(:artist, :title)
  end
end
