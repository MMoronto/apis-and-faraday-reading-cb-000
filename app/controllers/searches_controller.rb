class SearchesController < ApplicationController
  def search
  end

  def foursquare
  begin  
    @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
      req.params['client_id'] = 'TVVTJ45J53WCH42DLYJSFW5J3BT25HDQXCQ1KBCK0ZKISWSG'
      req.params['client_secret'] = 'U4VI1GYY3FF5G0EKMAXJWAPXJKOAOD0RXL23TAPFLI3KZTVK'
      req.params['v'] = '20160201'
      req.params['near'] = params[:zipcode]
      req.params['query'] = 'coffee shop'
    end
    body = JSON.parse(@resp.body)
    if @resp.success?
      @venues = body["response"]["venues"]
    else
      @error = body["meta"]["errorDetail"]
    end
    
  rescue Faraday::ConnectionFailed
    @error = "There was a timeout. Please try again."
  end    
  render 'search'
  end
end