require 'httparty'
require 'thread'
require 'faraday'
require 'faraday-cookie_jar'

# Add new column to jobs, state:integer, use enum for state in the model.
# Manually add null:false, default:0 to the state in the migration
# Save the job in

class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_connection, only: [:create, :new, :ezcount_charge_verify]

  def set_connection
    @conn = Faraday.new(:url => 'https://demo.ezcount.co.il') do |c|
      c.use Faraday::Request::UrlEncoded
      c.use Faraday::Response::Logger
      c.use Faraday::Adapter::NetHttp
      c.use :cookie_jar # to maintain the session cookie across the @payment and @verify requests
      c.response :json, :content_type => /\bjson$/
    end
  end

  # GET /jobs
  # GET /jobs.json
  def index
    # to filter style keys in _panel and jobs index view
    # @categories = Category.where.not(name: "General")
    @positions = Position.all
    @categories = Category.all
    @style_hash = {
      general: "link",
      kitchen:  "success",
      service: "blue",
      management: "primary",
      hotel: "info"
    }
    # Filter the jobs by categories only, positions will be added later on.
    filter
  end

  def filter

    if(params.has_key?(:category) && params.has_key?(:location) && params.has_key?(:position))
      @jobs = Job.joins(position: :category).where(positions: { name: "#{params[:position]}" }, categories: { name: "#{params[:category].capitalize}" }, location: params[:location]).order("created_at desc")
    elsif(params.has_key?(:category) && params.has_key?(:location))
      @jobs = Job.joins(position: :category).where(categories: { name: "#{params[:category].capitalize}" }, location: params[:location]).order("created_at desc")
    elsif(params.has_key?(:category) && params.has_key?(:position))
      @jobs = Job.joins(position: :category).where(positions: { name: "#{params[:position]}" }, categories: { name: "#{params[:category].capitalize}" }).order("created_at desc")
    elsif(params.has_key?(:location) && params.has_key?(:position))
      @jobs = Job.joins(position: :category).where(positions: { name: "#{params[:position]}" }, location: params[:location]).order("created_at desc")
    elsif(params.has_key?(:category))
      @jobs = Job.joins(position: :category).where(categories: { name: "#{params[:category].capitalize}" }).order("created_at desc")
    elsif(params.has_key?(:location))
      @jobs = Job.where(location: params[:location]).order("created_at desc")
    else
      @jobs = Job.all.order("created_at desc")
    end

    # case params
    # when (params.has_key?(:category) && params.has_key?(:location))
    #   @jobs = Job.joins(position: :category).where(categories: { name: "#{params[:category].capitalize}" }, location: params[:location]).order("created_at desc")
    # when (params.has_key?(:category))
    #   @jobs = Job.joins(position: :category).where(categories: { name: "#{params[:category].capitalize}" }).order("created_at desc")
    # when (params.has_key?(:location))
    #   @jobs = Job.where(location: params[:location]).order("created_at desc")
    # else
    #   @jobs = Job.all.order("created_at desc")
    # end

  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    @job = current_user.jobs.build
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json

  def create

    @job = current_user.jobs.build(job_params)

    # @position = @job.position_id
    # @job.position_id = Position.find_by_name("#{job_params[position]}")

    if @job.save
      ezcount_charge
      url = @payment.body["url"]
      redirect_to url
    else
      render :new
    end
  end

  def ezcount_charge
    @payment = @conn.post do |req|
      req.url '/api/payment/prepareSafeUrl/clearingFormForWeb'
      req.headers['Content-Type'] = 'application/json'
      req.body = {:sum => 5,
                  :successUrl => "#{root_url}jobs/#{@job.id}/payment_success",
                  :api_key => '4c4b3fd224e0943891588ea5a70d6cb566af3a5b4d506908ca04b30526234551',
                  :developer_email => 'DEVELOPER@example.com',
                  :api_email => 'demo@ezcount.co.il'}.to_json
    end
    secretTransactionId = @payment.body["secretTransactionId"]
    session[:transactionId] = secretTransactionId
    session[:job_posting] = @job
  end

  def ezcount_charge_verify
    @url = "https://demo.ezcount.co.il/api/payment/validate/#{session[:transactionId]}"

    @verify = @conn.post do |req|
      req.url @url
      req.headers['Content-Type'] = 'application/json'
      req.body = {:api_key => '4c4b3fd224e0943891588ea5a70d6cb566af3a5b4d506908ca04b30526234551',
                  :developer_email => 'DEVELOPER@example.com'}.to_json
    end

    session[:transactionId] = ""

    # @job.destroy if @verified == false
    if @verify.body["success"] == true
      @job = Job.find(params[:id])
      @job.state = 1
      @job.save!
      #UserMailer.job_posted(user).deliver_now
      redirect_to job_path, notice: 'המשרה פורסמה בהצלחה.'
    else
      redirect_to root_path
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'המשרה עודכנה בהצלחה.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'המשרה הוסרה בהצלחה.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_job
    @job = Job.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.

  def job_params
    params.require(:job).permit(:title, :description, :job_type, :location, :job_author, :avatar, :position_id, :job_phone)
  end
end
