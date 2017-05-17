class ShowsController < ApplicationController
  def new
    @show = Show.new
  end

  def edit
    @show = Show.find(params[:id])
  end

  def create
    @show = Show.new(show_params)
    if @show.save
      redirect_to welcome_index_path
    else
      render 'new'
    end
  end

  def update
    @show = Show.find(params[:id])

    if @show.update(show_params)

      redirect_to welcome_index_path
    else
      render 'edit'
    end
  end

  def destroy
    @show = Show.find(params[:id])
    @show.destroy
    redirect_to welcome_index_path
  end

  private

  def show_params
      params.require(:show).permit(:artist, :title)
  end
end
