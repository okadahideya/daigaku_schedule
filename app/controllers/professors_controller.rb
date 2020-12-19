class ProfessorsController < ApplicationController
  before_action :authenticate_any!
  def index
  end

  def show
    @professor = Professor.find(params[:id])
  end

end
