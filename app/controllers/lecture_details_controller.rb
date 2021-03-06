class LectureDetailsController < ApplicationController

  def index
    @lecture = Lecture.find(params[:lecture_id])
    @lecture_detail = LectureDetail.where(professor_id: current_professor.id, lecture_id: params[:lecture_id])
  end

  def new
    @lecture = Lecture.find(params[:lecture_id])
    @lecture_detail = LectureDetail.new
  end

  def create
    @lecture_detail = LectureDetail.new(lecture_detail_params)
    if @lecture_detail.save
     redirect_to action: :index
    else
      render :new
    end
  end

  def edit
    @lecture_detail = LectureDetail.find(params[:id])
  end

  def update
    @lecture_detail = LectureDetail.find(params[:id])
    if  @lecture_detail.update(lecture_detail_params)
      redirect_to action: :index, id: @lecture_detail.lecture_id
    else
      render :edit
    end
  end

  def destroy
    @lecture_detail = LectureDetail.find(params[:id])
    @lecture_detail.destroy
    redirect_to lecture_lecture_details_path(@lecture_detail.lecture_id)
  end

  def show
    @lecture_detail = LectureDetail.find(params[:id])
    @submission = Submission.where(lecture_detail_id: @lecture_detail.id)
  end

  def download
    @lecture_detail = LectureDetail.find(params[:id])
    send_data(
      ActiveStorage::Blob.service.send(:path_for, @lecture_detail.lecture_office.key), 
      type: @lecture_detail.lecture_office.content_type, filename: @lecture_detail.lecture_office.filename
      )
  end

  private

  def lecture_detail_params
    params.require(:lecture_detail).permit(:lecture_date, :lecture_title_list, :lecture_text, :lecture_office).merge(professor_id: current_professor.id, lecture_id: params[:lecture_id])
  end

end
