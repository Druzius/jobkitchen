require 'json'
require "net/http"
require 'openssl'
class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # register to demo.ezcount.co.il to get your own test keys
  api_key = '4c4b3fd224e0943891588ea5a70d6cb566af3a5b4d506908ca04b30526234551'
  api_email = 'demo@ezcount.co.il'
  # DEVELOPER information, we will notify you for any API problem to this details
  developer_email = 'danubusiness10@gmail.com'
  developer_phone = '0508289809'

  url = 'https://demo.ezcount.co.il/api/createDoc'

  data={
    # CUSTOMER credentials
    api_key: api_key,
    api_email: api_email,
    # developer data
    developer_email: developer_email,
    developer_phone: developer_phone,
    # invoice reciept
    type: 320,
    description: "Monthly payment for service",
    customer_name: "customer name",
    customer_email: "client@demo.com",
    customer_address: "Full customer address, city, and house num 42",
    item:[{
            catalog_number: "MKT1",
            details: "item details",
            amount: 1,
            price: 255,
            #this price include the VAT
            vat_type: "PRE"
    }],
    payment:[{
               # bank transfer
               payment_type: 4,
               payment: 255,
               comment: "transaction number is 23423423"
    }],
    # THIS IS A MUST ONLY IN INVOICE RECIEPT
    price_total: 255,
    comment: "some general comment for the document",
  }.to_json



  uri = URI(url)
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  warn "!!SSL disabled due to a windows bug, https://gist.github.com/luislavena/f064211759ee0f806c88, please do validation in production !!"
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  req = Net::HTTP::Post.new(uri.path, "Content-Type" => "application/json")
  req.body = data
  res = http.request(req)
  puts "response #{res.body}"

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

    token = params[:stripeToken]
    job_type = params[:job_type]
    job_title = params[:title]
    location = params[:location]
    card_brand = params[:user][:card_brand]
    card_exp_month = params[:user][:card_exp_month]
    card_exp_year = params[:user][:card_exp_year]
    card_last4 = params[:user][:card_last4]

    charge = Stripe::Charge.create(
      :amount => 24900,
      :currency => "ils",
      :description => job_type,
      :statement_descriptor => job_title,
      :source => token
    )

    current_user.stripe_id = charge.id
    current_user.card_brand = card_brand
    current_user.card_exp_month = card_exp_month
    current_user.card_exp_year = card_exp_year
    current_user.card_last4 = card_last4
    current_user.save!

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Your job listing was successfully purchased' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end


  rescue Stripe::CardError => e
    flash.alert = e.message
    render action: :new
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
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
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
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
