class JobApplicationsController < ApplicationController
  # def index
  #     user dashboard for all applications
  # end

  def new
    @job = Job.find(params[:job_id])
    @job_applications = JobApplication.new
  end

  def create
    @job = Job.find(params[:job_id])
    @job_applications = JobApplication.new(job_application_params)
    @job_applications.user = current_user
    if @job_applications.save!
      redirect_to jobs_path
    else
      render :new
    end
  end

  def destroy
    @job_applications = JobApplication.find(params[:id])
    @job_application.destroy
    redirect_to jobs_path
  end
end
