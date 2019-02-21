require 'httparty'
require 'thread'
require 'httparty_with_cookies'

# require 'rest-client'

class My_awesome_cookie_using_api
  include HTTParty_with_cookies
end



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
    @job.save if ezcount_charge_verify_with_httparty
  end

  # https://stackoverflow.com/questions/50048446/getting-setting-session-with-httparty
  # https://stackoverflow.com/questions/38829525/persist-session-cookies-across-successive-get-requests
  # "HTTParty is good for a lot of things, but maintaining sessions is not necessarily one of them. Have you tried Faraday? It's a lot more extensible. – tadman Apr 26 '18 at 23:45"

  def ezcount_charge_verify_with_typhoeus
  end

  # def ezcount_charge_verify_with_restclient
  #   # https://github.com/rest-client/rest-client
  #   # https://github.com/rest-client/rest-client#cookies

  #   params = {
  #     :sum => '5',
  #     :successUrl => 'http://localhost:3000/',
  #     :api_key => 'f1c85d16fc1acd369a93f0489f4615d93371632d97a9b0a197de6d4dc0da51bf',
  #     :developer_email => 'DEVELOPER@example.com',
  #     :api_email => 'demo@ezcount.co.il'
  #   }.to_json
  #   response = RestClient.post('https://demo.ezcount.co.il/api/payment/prepareSafeUrl/clearingFormForWeb', params: {sum: 5},
  #                              { successUrl: 'http://localhost:3000/', api_key: 'f1c85d16fc1acd369a93f0489f4615d93371632d97a9b0a197de6d4dc0da51bf',
  #                                developer_email: 'DEVELOPER@example.com', api_email: 'demo@ezcount.co.il'})

  #   raise
  # end

  def ezcount_charge_verify_with_faraday

  end

  def ezcount_charge_verify_with_httparty

    # api = My_awesome_cookie_using_api.new
    # api.get 'http://someurl.com/endpoint'
    # api.cookies['darkside'] #=> 'We have cookies!'


    threads = []
    threads << Thread.new {
      @result = My_awesome_cookie_using_api.new
      @result.post('https://demo.ezcount.co.il/api/payment/prepareSafeUrl/clearingFormForWeb',
                   :body => { :sum => 5,
                              :successUrl => 'http://localhost:3000/trabsactions#new',
                              :api_key => '4c4b3fd224e0943891588ea5a70d6cb566af3a5b4d506908ca04b30526234551',
                              :developer_email => 'DEVELOPER@example.com',
                              :api_email => 'demo@ezcount.co.il'
                              }.to_json,
                   :headers => { 'Content-Type' => 'application/json' } )
      # @sys_token = @result["secretTransactionId"]
      # redirect_to @result["url"]
    }

    threads << Thread.new {
      # @sys_token = '123'
      @url = "https://demo.ezcount.co.il/api/payment/validate/"
      # @url_request = @url + @sys_token
      @url2 = "https://demo.ezcount.co.il/api/payment/validate/#{@sys_token}"
      @result2 = My_awesome_cookie_using_api.new
      @result2.post(@url2,
                    :body => { :sum => 5,
                               :successUrl => 'http://localhost:3000/',
                               :api_key => '4c4b3fd224e0943891588ea5a70d6cb566af3a5b4d506908ca04b30526234551',
                               :developer_email => 'DEVELOPER@example.com',
                               :api_email => 'demo@ezcount.co.il'
                               }.to_json,
                    :headers => { 'Content-Type' => 'application/json' })
    }

    threads.each(&:join) # this waits for all the threads to finish before proceeding
    raise
  end
  # request = JSON.parse(request.body)
  # redirect_to request["url"]

  # 1. put data parameters in the get request
  # 2. extend session across multiple get and post requests
  # 3. use data from first request sys_token to make second request
  # 3. use SSL

  # first request: https://demo.ezcount.co.il/api/payment/prepareSafeUrl/clearingFormForWeb
  # second request: https://demo.ezcount.co.il/api/payment/validate/#{sys_token}

  # data = {
  #   api_key: ENV["EZCOUNT_API_ENV_SECRET"],
  #   api_email: ENV["EZCOUNT_API_EMAIL_ENV_SECRET"],
  #   developer_email: ENV["EZCOUNT_DEV_EMAIL_ENV_SECRET"],
  #   sum: 5,
  #   successUrl: "http://localhost:3000/"
  # }.to_json

  # uri = URI ENV["EZCOUNT_URL_ENV_SECRET"]

  # first clearing form request
  # http = Net::HTTP.new(uri.host, uri.port)
  # http.use_ssl = true
  # warn "!!SSL disabled due to a windows bug, https://gist.github.com/luislavena/f064211759ee0f806c88, please do validation in production !!"
  # http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  # req = Net::HTTP::Post.new(uri.path, "Content-Type" => "application/json")
  # req.body = data
  # res = http.request(req)
  # puts "response #{res.body}"

  # response_hash = JSON.parse(res.body)
  # redirect_to response_hash["url"]

  # second verification request
  # sys_token = response_hash["url"][-36..-1]
  # val_url = "https://demo.ezcount.co.il/api/payment/validate/#{sys_token}"

  # # uri_validate = URI val_url
  # # http2 = Net::HTTP.new(uri_validate.host, uri_validate.port)
  # # http2.use_ssl = true
  # warn "!!SSL disabled due to a windows bug, https://gist.github.com/luislavena/f064211759ee0f806c88, please do validation in production !!"
  # http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  # req2 = Net::HTTP::Post.new(uri_validate.path, "Content-Type" => "application/json")
  # req2.body = data
  # res2 = http2.request(req2)
  # puts "response #{res2.body}"

  # response_hash2 = JSON.parse(res2.body)
  # success = response_hash2["cgp_id"]



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
