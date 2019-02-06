class JobApplicationsController < ApplicationController
  # def index
  #     user dashboard for all applications
  # end

  def new
    @job = Job.find(params[:job_id])
    @job_application = JobApplication.new
  end

  def create
    @job = Job.find(params[:job_id])
    @job_application = JobApplication.new(job_application_params)
    @job_application.job = @job
    # @job_application.user = current_user
    if @job_application.save!
      redirect_to jobs_path
    else
      render :new
    end
  end

  def destroy
    @job_application = JobApplication.find(params[:id])
    @job_application.destroy
    redirect_to jobs_path
  end

  private

  def job_application_params
    params.require(:job_application).permit(:phone_number, :email, :city, :full_name, :resume, :work_experience, :summary)
  end

  # def job_params
  #   params.require(:job).permit(:title, :description, :job_type, :location, :job_author, :avatar)
  # end
end
