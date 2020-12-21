class LecturesController < ApplicationController


  def new
    @lecture = Lecture.new
  end

  def create
    @lecture = Lecture.new(lecture_params)
    if @lecture.save
      redirect_to controller: :professors, action: :index
    else
      render :new
    end
  end

  def show
    @lecture = Lecture.where(professor_id: params[:id])
  end

  def edit
  end

  def update
  end

  def destory
  end



  private

  def lecture_params
    params.require(:lecture).permit(:lecture_image, :lecture_title, :contents,).merge(professor_id: current_professor.id)
  end

end
