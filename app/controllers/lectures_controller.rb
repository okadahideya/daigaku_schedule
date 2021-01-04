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
    @lecture = Lecture.find(params[:id])
  end

  def update
    @lecture = Lecture.find(params[:id])
    if @lecture.update(lecture_params)
      redirect_to lecture_path(@lecture.professor_id)
    else
      render :edit
    end
  end

  def destroy
    @lecture = Lecture.find(params[:id])
    @lecture.destroy
    redirect_to lecture_path(@lecture.professor_id)
  end

  private

  def lecture_params
    params.require(:lecture).permit(:lecture_image, :lecture_title, :contents,).merge(professor_id: current_professor.id)
  end

end
