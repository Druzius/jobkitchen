require 'will_paginate/array'

## >>>>>>> EZCOUNT <<<<<<<

# require 'httparty'
# require 'thread'
# require 'faraday'
# require 'faraday-cookie_jar'

## >>>>>>> EZCOUNT_END <<<<<<<

# Add new column to jobs, state:integer, use enum for state in the model.
# Manually add null:false, default:0 to the state in the migration
# Save the job in

class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  ## >>>>>>> EZCOUNT <<<<<<<
  # before_action :set_connection, only: [:create, :new, :ezcount_charge_verify, :ezcount_document_creation]
  ## >>>>>>> EZCOUNT_END <<<<<<<

## >>>>>>> EZCOUNT <<<<<<<
  # def set_connection
  #   @conn = Faraday.new(:url => 'https://api.ezcount.co.il') do |c|
  #     c.use Faraday::Request::UrlEncoded
  #     c.use Faraday::Response::Logger
  #     c.use Faraday::Adapter::NetHttp
  #     c.use :cookie_jar # to maintain the session cookie across the @payment and @verify requests
  #     c.response :json, :content_type => /\bjson$/
  #   end
  # end
## >>>>>>> EZCOUNT_END <<<<<<<

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
    # Filter the jobs by categories only and positions and locations.
    filter

    # Job.page(params[:page]).order('created_at DESC')

    # pagination
    # @jobs = Job.paginate(page: params[:page])
  end

  def filter
    # Filter the jobs by categories only and positions and locations.
    if(params.has_key?(:category) && params.has_key?(:location) && params.has_key?(:position))
      @jobs = Job.joins(position: :category).where(positions: { name: "#{params[:position]}" }, categories: { name: "#{params[:category].capitalize}" }, location: params[:location]).paginate(page: params[:page]).order("created_at desc")
    elsif(params.has_key?(:category) && params.has_key?(:location))
      @jobs = Job.joins(position: :category).where(categories: { name: "#{params[:category].capitalize}" }, location: params[:location]).paginate(page: params[:page]).order("created_at desc")
    elsif(params.has_key?(:category) && params.has_key?(:position))
      @jobs = Job.joins(position: :category).where(positions: { name: "#{params[:position]}" }, categories: { name: "#{params[:category].capitalize}" }).paginate(page: params[:page]).order("created_at desc")
    elsif(params.has_key?(:location) && params.has_key?(:position))
      @jobs = Job.joins(position: :category).where(positions: { name: "#{params[:position]}" }, location: params[:location]).paginate(page: params[:page]).order("created_at desc")
    elsif(params.has_key?(:category))
      @jobs = Job.joins(position: :category).where(categories: { name: "#{params[:category].capitalize}" }).paginate(page: params[:page]).order("created_at desc")
    elsif(params.has_key?(:location))
      @jobs = Job.where(location: params[:location]).paginate(page: params[:page]).order("created_at desc")
    else
      @jobs = Job.all.paginate(page: params[:page]).order("created_at desc")
    end
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

    if @job.save
      current_user.admin = true
      current_user.save
      # @job.state = 1
      @job.save!
      UserMailer.job_posted(current_user).deliver_now
      redirect_to '/pages/thank_you', notice: 'המשרה פורסמה בהצלחה.'
    else
      render :new
      ## >>>>>>> EZCOUNT <<<<<<<
      # ezcount_charge
      # url = @payment.body["url"]
      # redirect_to url
    # else
    #   render :new
      ## >>>>>>> EZCOUNT_END <<<<<<<
    end
  end

  ## >>>>>>> EZCOUNT <<<<<<<
  # def ezcount_charge
  #   @payment = @conn.post do |req|
  #     req.url '/api/payment/prepareSafeUrl/clearingFormForWeb'
  #     req.headers['Content-Type'] = 'application/json'
      ## change to 5 when testing, 116 when not testing.
      ## test api key f1c85d16fc1acd369a93f0489f4615d93371632d97a9b0a197de6d4dc0da51bf
      ## dev api key ENV['EZCOUNT_API']
  #     req.body = {:sum => 116,
  #                 :successUrl => "#{root_url}jobs/#{@job.id}/payment_success",
  #                 :api_key => ENV['EZCOUNT_API'],
  #                 :developer_email => 'venomdrophearthstone@gmail.com',
  #                 :api_email => 'demo@ezcount.co.il'}.to_json
  #   end
  #   secretTransactionId = @payment.body["secretTransactionId"]
  #   session[:customer_name] = @payment.body["cgp_customer_name"]
  #   session[:transactionId] = secretTransactionId
  #   session[:job_posting] = @job
  # end
  ## >>>>>>> EZCOUNT_END <<<<<<<

  ## >>>>>>> EZCOUNT <<<<<<<

  # def ezcount_charge_verify
  #   @url = "https://api.ezcount.co.il/api/payment/validate/#{session[:transactionId]}"

  #   @verify = @conn.post do |req|
  #     req.url @url
  #     req.headers['Content-Type'] = 'application/json'
  #     req.body = {:api_key => ENV['EZCOUNT_API'],
  #                 :developer_email => 'DEVELOPER@example.com'}.to_json
  #   end

  #   if @verify.body["success"] == true
  #     @job = Job.find(params[:id])
  #     @job.state = 1
  #     @job.save!
  #     ezcount_document_creation
  #     UserMailer.job_posted(current_user).deliver_now
  #     redirect_to '/pages/thank_you', notice: 'המשרה פורסמה בהצלחה.'
  #   else
  #     redirect_to root_path
  #   end
  # end
  ## >>>>>>> EZCOUNT_END <<<<<<<

  ## >>>>>>> EZCOUNT <<<<<<<
  ## To test, change prices from 116 to 5, and api.ezcount on the 2 urls to demo.ezcount
  # def ezcount_document_creation
  #   @document = @conn.post do |req|
  #     req.url '/api/createDoc'
  #     req.headers['Content-Type'] = 'application/json'
  #     req.body = {:type => 320,
  #                 # => change api key
  #                 :transaction_id => session[:transactionId],
  #                 :api_key => ENV['EZCOUNT_API'],
  #                 :developer_email => 'venomdrophearthstone@gmail.com',
  #                 :customer_name => @job.job_author,
  #                 :customer_address => @job.address,
  #                 :customer_email => @job.user.email,
  #                 :customer_phone => @job.job_phone,
  #                 :item => [{
  #                             details: "רכישת משרה בג'וב קיטצ'ן",
  #                             price: 116.0,
  #                             amount: 1
  #                 }],
  #                 :price_total => 116.0,
  #                 :payment => [{
  #                                payment_type: 1,
  #                                date: Time.now.strftime("%d/%m/%Y"),
  #                                payment_sum: 116.0
  #                 }]
  #                 }.to_json
  #   end
  #   session.delete(:transactionId)
  #   session.delete(:customer_name)
  # end
  ## >>>>>>> EZCOUNT_END <<<<<<<

  ## PATCH/PUT /jobs/1
  ## PATCH/PUT /jobs/1.json
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
    params.require(:job).permit(:title, :description, :job_type, :location, :job_author, :avatar, :position_id, :job_phone, :address)
  end
end
