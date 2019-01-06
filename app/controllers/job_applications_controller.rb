class JobApplicationsController < ApplicationController
  # def index
  #     user dashboard for all applications
  # end

  def new
    @job_applications = JobApplication.new
  end

  def create

  end

  def destroy

  end

end
