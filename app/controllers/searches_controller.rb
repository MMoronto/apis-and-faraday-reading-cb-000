class SearchesController < ApplicationController
  def search
  end

  def foursquare
    Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
      req.params['client_id'] = 'TVVTJ45J53WCH42DLYJSFW5J3BT25HDQXCQ1KBCK0ZKISWSG'
      req.params['client_secret'] = 'U4VI1GYY3FF5G0EKMAXJWAPXJKOAOD0RXL23TAPFLI3KZTVK'
      req.params['v'] = '20160201'
      req.params['near'] = params[:zipcode]
      req.params['query'] = 'coffee shop'
    end
    
    body_hash = JSON.parse(@resp.body)
    @venues = body_hash["response"]["venues"]
    render 'search'    
    render 'search'
  end
end