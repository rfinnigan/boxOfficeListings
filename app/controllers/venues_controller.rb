# controller for Venues resource
class VenuesController < ApplicationController
  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
  end

  def new
    @venue = Venue.new
    2.times { @venue.rooms.build}
  end

  def edit
    @venue = Venue.find(params[:id])
  end

  def create
    @venue = Venue.new(venue_params)

    if @venue.save
      redirect_to @venue
    else
      render 'new'
    end
  end

  def update
    @venue = Venue.find(params[:id])

    if @venue.update(venue_params)
      redirect_to @venue
    else
      render 'edit'
    end
  end

  def destroy
    @venue = Venue.find(params[:id])
    @venue.destroy

    redirect_to venues_path
  end

  private

  def venue_params
    params.require(:venue).permit(:name, rooms_attributes: [:id, :roomName])
  end
end
