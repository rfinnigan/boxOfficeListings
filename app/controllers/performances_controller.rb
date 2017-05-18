class PerformancesController < ApplicationController
  before_action :set_show, only: [:index, :new, :create]

  def new
    @performance = Performance.new(room_id: 1)
  end

  def edit
    @performance = Performance.find(params[:id])
  end

  def create
    @performance = @show.performances.create(performance_params)
    if @performance.save
      redirect_to shows_path
    else
      render 'new'
    end
  end

  def update
    @performance = Performance.find(params[:id])

    if @performance.update(performance_params)
      @show = Show.find(@performance[:show_id])
      redirect_to shows_path
    else
      render 'edit'
    end
  end

  def destroy
    @performance = Performance.find(params[:id])
    @show = Show.find(@performance[:show_id])
    @performance.destroy
    redirect_to shows_path
  end

  private

  # method for settting show instance variable
  # from passed show_id param
  # when using shallow nesting this will only work when called
  # from index, new and create as only these receive this param
  def set_show
    @show = Show.find(params[:show_id])
  end

  def performance_params
      params.require(:performance).permit(:date, :time, :duration, :room_id)
  end
end
