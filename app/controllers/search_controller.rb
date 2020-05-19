class SearchController < ApplicationController
  def index
    house = params[:house]
    griff_id = "5a05e2b252f721a3cf2ea33f"
    
    conn = Faraday.new(url: "https://www.potterapi.com/v1") do |faraday|
        # binding.pry
        faraday.headers["key"] = ENV["POTTER_API_KEY"]
    end

    response = conn.get("/houses/#{griff_id}")
    # binding.pry
  end
end
