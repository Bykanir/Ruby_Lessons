require 'net/http'

class Query

  attr_reader :response

  def initialize(url)
  	get(url)
  end

  def code_response
  	response.code
  end

  def body_response
  	response.body
  end

  def headers_response
  	response.each_header do |key, value|
  	  key
  	end
  end

  private

  def get(url)
    uri = URI(url)
    request = Net::HTTP::Get.new(uri)

    http         = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true if uri.instance_of?(URI::HTTPS)

    @response = http.request(request)
  end
end