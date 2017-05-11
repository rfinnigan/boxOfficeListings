# controller for Venues resource
class VenuesController < ApplicationController
  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
  end

  def new
  end

  def create
    @venue = Venue.new(venue_params)

    @venue.save
    redirect_to @venue
  end
end

private

def venue_params
  params.require(:venue).permit(:name)
end
