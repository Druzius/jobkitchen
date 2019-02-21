require 'net/http'
require 'uri'
#on windows env, ruby have problems with verify certificates
require 'openssl'

class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /jobs
  # GET /jobs.json
  def index

    if(params.has_key?(:job_type))
      @jobs = Job.where(job_type: params[:job_type]).order("created_at desc")
    elsif(params.has_key?(:location))
      @jobs = Job.where(location: params[:location]).order("created_at desc")
    else
      @jobs = Job.all.order("created_at desc")
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


  def ezcount_form
    api_key = '4c4b3fd224e0943891588ea5a70d6cb566af3a5b4d506908ca04b30526234551'
    developer_email = 'demo@ezcount.co.il'
    form_url = 'https://demo.ezcount.co.il/api/payment/prepareSafeUrl/clearingFormForWeb'

    data = {
      api_key: api_key,
      developer_email: developer_email,
      sum: 5.33,
      successUrl: "http://localhost:3000/pages/"
    }.to_json

    uri = URI(form_url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    warn "!!SSL disabled due to a windows bug, https://gist.github.com/luislavena/f064211759ee0f806c88, please do validation in production !!"
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    req = Net::HTTP::Post.new(uri.path, "Content-Type" => "application/json")
    req.body = data
    res = http.request(req)
    puts "response #{res.body}"

    # KSYS TOKEN PARAMETER, TRY PARSING?
    # SAVE KSYS TOKEN AS A PARAMETER
    # ONCE USER REDIRECTS THE VARIABLES ARE CLEARED, NEED TO KEEP THE SYS TOKEN IN THE SAME SESSION
    response_hash = JSON.parse(res.body)
    secret = response_hash["secretTransactionId"]
    redirect_to response_hash["url"]

    #puts ksys_token

    # return false if response_hash["secretTransactionId"]
    end

    def ezcount_validation

    val_url = "https://demo.ezcount.co.il/api/payment/validate/#{secret}"

    puts val_url
    puts "SJAAAAAAAAAAAAAAAAAAAAAKKKKKKKKK/#{secret}"

    # validation json request

    data2 = {
      developer_email: 'venomdrophearthstone@gmail.com',
      api_key: '4c4b3fd224e0943891588ea5a70d6cb566af3a5b4d506908ca04b30526234551'
    }.to_json

    # USE THE PARAMETER OF SYS TOKEN, AND NOT URL FOR SYS TOKEN

    uri_validate = URI(val_url)
    http2 = Net::HTTP.new(uri_validate.host, uri_validate.port)
    http2.use_ssl = true
    warn "!!SSL disabled due to a windows bug, https://gist.github.com/luislavena/f064211759ee0f806c88, please do validation in production !!"
    http2.verify_mode = OpenSSL::SSL::VERIFY_NONE

     req2 = Net::HTTP::Post.new(uri_validate.path, "Content-Type" => "application/json")
      req2.body = data2
      res2 = http2.request(req2)
      #print "response #{res2.body}"
     response_hash2 = JSON.parse(res2.body)
     #puts response_hash2

    # success = response_hash2["cgp_id"]


  end

  def create
    @job = current_user.jobs.build(job_params)
    ezcount_form
    ezcount_validation
    @job.save
  end
  # rescue Stripe::CardError => e
  #   flash.alert = e.message
  #   render action: :new
  # end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'המשרה עודכנה בהצלחה' }
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
      format.html { redirect_to jobs_url, notice: 'המשרה הוסרה בהצלחה' }
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
    params.require(:job).permit(:title, :description, :job_type, :location, :job_author, :avatar)
  end
end
