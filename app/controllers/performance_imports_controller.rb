class PerformanceImportsController < ApplicationController
  require 'csv'

  def new
    @performance_import = PerformanceImport.new
  end

  def create
    @performance_import = PerformanceImport.new(performance_import_params)
    if @performance_import.save
      redirect_to venues_path, notice: "Imported performances successfully."
    else
      render :new
    end
  rescue ActionController::ParameterMissing => e
    new.errors.add(:base, 'No File Selected.' )
    render :new
  end

  private

  def performance_import_params
    params.require(:performance_import).permit(:file)
  end
end
