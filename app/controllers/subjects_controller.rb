class SubjectsController < ApplicationController
  def index
  end

  def new
    if user_signed_in?
      @subject = Subject.new
    else
      render :index
    end
  end

end
