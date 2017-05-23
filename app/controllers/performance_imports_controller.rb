class PerformanceImportsController < ApplicationController
  require 'csv'

  def new
    @performance_import = PerformanceImport.new
  end

  def create
    @performance_import = PerformanceImport.new(params[:performance_import])
    if @performance_import.save
      redirect_to venues_path, notice: "Imported performances successfully."
    else
      render :new
    end
  end
end
