class SessionsController < ApplicationController
  require 'net/http'
  require 'uri' 

  def new
  end

  def create
    # This segment of code is not functioning, tried to mess with api
    uri = URI('http://localhost:3000/a/pag/120/signin')
    #params = { :email => 'foo@bar.com', :password => 'foobar' }
    #uri.query = URI.encode_www_form(params)
    req = Net::HTTP::Get.new(uri)
    req.basic_auth 'user', 'pass'

    #res = Net::HTTP.get_response(uri)
    res = Net::HTTP.start(uri.hostname, uri.port) {|http|
      http.request(req)
    }
    render :text => res.body 
  end
  
  def destroy
    sign_out
    redirect_to root_url
  end
end
