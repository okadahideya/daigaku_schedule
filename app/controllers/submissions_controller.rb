class SubmissionsController < ApplicationController

  def new
    @submission_new = Submission.new
    @lecture_detail = LectureDetail.find(params[:id])
  end

  def create
    @submission_new = Submission.new(submission_params)
    if @submission_new.save
      redirect_to lecture_detail_path(id: @submission_new.lecture_detail_id)
    else
      render 'submissions/_new'
    end
  end

  def destroy
    @submission = Submission.find(params[:id])
    @submission.destroy
    redirect_to lecture_detail_path(id: @submission.lecture_detail_id)
  end

  def download
    @submission = Submission.find(params[:id])
    send_data(
      ActiveStorage::Blob.service.send(:path_for, @submission.user_office.key), 
      type: @submission.user_office.content_type, filename: @submission.user_office.filename
      )
  end

  private

  def submission_params
    params.permit(:user_office).merge(user_id: current_user.id, lecture_detail_id: params[:lecture_detail_id])
  end

end
