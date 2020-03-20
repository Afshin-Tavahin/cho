class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'
    @url = 'http://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=89129&distance=0&API_KEY=CB250367-2681-446D-BF70-B40A771D77ED'
    @uri = URI(@url)

    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)


    # Check for Wrong zip code or any error
    if @output.empty?
      @final_output = "ERROR"

      elsif !@output
       @final_output = "ERROR"

    else
      @final_output = @output[0]['AQI']
    end
  end
end
