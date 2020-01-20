class RestaurantsController < ApplicationController
  def top
    @range_options = [["300m", 1], ["500m", 2], ["1000m", 3], ["2000m", 4], ["3000m", 5]]
  end
  
  def list
    require 'open-uri'
    
    query = params[:query]
      
    session[:query] = query.permit!
    url = build_url(query)
    response = open(url)
    
    if response.status[0] == "200"
      json = JSON.parse(response.read, { symbolize_names: true })
      @rests = json[:rest]
    end

  end

  def detail
    require 'open-uri'
    require "json"
    id = params[:id]
    url = build_url({ id: id })
    response = open(url)

    if response.status[0] == "200"
      json = JSON.parse(response.read, { symbolize_names: true })
      @rest = json[:rest]
    end
  end


  private

    def build_url(query)
      url = 'https://api.gnavi.co.jp/RestSearchAPI/v3/'
      query[:keyid] = '01f9ef3cbda80e59ec77e248cefb38db'

      url = url + '?' + query.to_query
    end


end
