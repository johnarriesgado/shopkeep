class JobsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  def index
    @jobs = params[:search] ? Job.where("title ILIKE ?", "%#{params[:search]}%") : Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = current_user.jobs.build(job_params)

    if @job.save
      redirect_to jobs_index_path, notice: "Job created successfully."
    else
      render :new
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :salary)
  end
end
