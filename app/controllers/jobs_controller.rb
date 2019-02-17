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
  def create
    @job = current_user.jobs.build(job_params)

    # token = params[:stripeToken]
    # job_type = params[:job_type]
    # job_title = params[:title]
    # location = params[:location]
    # card_brand = params[:user][:card_brand]
    # card_exp_month = params[:user][:card_exp_month]
    # card_exp_year = params[:user][:card_exp_year]
    # card_last4 = params[:user][:card_last4]

    # charge = Stripe::Charge.create(
    #   :amount => 24900,
    #   :currency => "ils",
    #   :description => job_type,
    #   :statement_descriptor => job_title,
    #   :source => token
    # )

    # current_user.stripe_id = charge.id
    # current_user.card_brand = card_brand
    # current_user.card_exp_month = card_exp_month
    # current_user.card_exp_year = card_exp_year
    # current_user.card_last4 = card_last4
    # current_user.save!

    # respond_to do |format|

    api_key = '4c4b3fd224e0943891588ea5a70d6cb566af3a5b4d506908ca04b30526234551'
    api_email = 'demo@ezcount.co.il'
    developer_email = 'DEVELOPER@example.com'
    url = 'https://demo.ezcount.co.il/api/payment/prepareSafeUrl/clearingFormForWeb'

    data = {
      api_key: api_key,
      api_email: api_email,
      developer_email: developer_email,
      sum: 5,
      successUrl: "http://localhost:3000/"
    }.to_json

    uri = URI url
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    warn "!!SSL disabled due to a windows bug, https://gist.github.com/luislavena/f064211759ee0f806c88, please do validation in production !!"
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    req = Net::HTTP::Post.new(uri.path, "Content-Type" => "application/json")
    req.body = data
    res = http.request(req)
    puts "response #{res.body}"

    response_hash = JSON.parse(res.body)
    redirect_to response_hash["url"]

    # @job.systoken = 1


    # validation json request

    data2 = {
      api_key: api_key,
      developer_email: developer_email
    }.to_json

    sys_token = response_hash["url"][-36..-1]
    val_url = "https://demo.ezcount.co.il/api/payment/validate/#{sys_token}"

    uri_validate = URI val_url
    http2 = Net::HTTP.new(uri_validate.host, uri_validate.port)
    http2.use_ssl = true
    warn "!!SSL disabled due to a windows bug, https://gist.github.com/luislavena/f064211759ee0f806c88, please do validation in production !!"
    http2.verify_mode = OpenSSL::SSL::VERIFY_NONE

    req2 = Net::HTTP::Post.new(uri_validate.path, "Content-Type" => "application/json")
    req2.body = data2
    res2 = http2.request(req2)
    puts "response #{res2.body}"

    response_hash2 = JSON.parse(res2.body)
    success = response_hash2["cgp_id"]
    @job.create if validate_ezcount(success)


    @job.save if success == ""

    if @job.save
      # format.html { redirect_to @job, notice: 'המשרה שלך התפרסמה בהצלחה' }
      # format.json { render :show, status: :created, location: @job }
    else
      format.html { render :new }
      format.json { render json: @job.errors, status: :unprocessable_entity }
    end
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
