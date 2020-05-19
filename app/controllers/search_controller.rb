class SearchController < ApplicationController
  def index
    house = params[:house]
    
    conn = Faraday.new(url: "https://www.potterapi.com/v1") do |faraday|
        faraday.headers["X-API-KEY"] = ENV["POTTER_API_KEY"]
    end

    # response = conn.get("/houses/#{state}/current.json")
    response = conn.get("/houses")
    binding.pry
  end
end