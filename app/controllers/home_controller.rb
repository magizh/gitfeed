require 'net/http'
require 'json'
class HomeController < ApplicationController

	def index 
		uri = URI('https://api.github.com/orgs/cloudfoundry/events')
		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = true
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE # read into this
		data = http.get(uri.request_uri)
		@data = JSON.load(data.body)		
		# uncomment below line to inspect element in the  browser
		#raise @data[0].inspect
	end 

end
