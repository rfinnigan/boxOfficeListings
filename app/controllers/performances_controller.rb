class PerformancesController < ApplicationController
  before_action :set_venue_room_and_show, only: [:index, :new, :create]

  def new
    @performance = Performance.new
  end

  def create
    @performance = @show.performances.create(performance_params)
    redirect_to venue_path(@venue)
  end

  private

  # method for settting show, venue & room instance variables
  # from passed room_id param
  # when using shallow nesting this will only work when called
  # from index, new and create as only these receive this param
  def set_venue_room_and_show
    @show = Show.find(params[:show_id])
    @room = Room.find(@show[:room_id])
    @venue = Venue.find(@room[:venue_id])
  end

  def performance_params
      params.require(:performance).permit(:date, :time, :duration)
  end
end
