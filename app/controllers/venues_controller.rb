# controller for Venues resource
class VenuesController < ApplicationController
  def new
  end

  def create
    render plain: params[:venue].inspect
  end
end
