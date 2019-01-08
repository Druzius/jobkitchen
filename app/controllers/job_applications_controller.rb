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
    @job_application.user = current_user
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
end
