class Message < ApplicationRecord

# singletons
  class << self
    def get_new_releases
      response = RestClient::Request.new(
        :method => :get,
        :url => "https://developer.nps.gov/api/v0/newsreleases?q=glacier",
        headers: {:Authorization => ENV['API_KEY']}
      ).execute
      # response =JSON.parse(response)
      response =JSON.parse(response)['data'].sort_by { |i| Date.parse i['releaseDate'] }.reverse.map


    end

    def get_alerts
      response = RestClient::Request.new(
        :method => :get,
        :url => "https://developer.nps.gov/api/v0/alerts?limit=5",
        headers: {:Authorization => ENV['API_KEY']}
      ).execute
      response = JSON.parse(response)['data'].sort_by { |i| i['id']}.reverse.map
    end

    def search(park_code)
      response_1 = RestClient::Request.new(
        :method => :get,
        :url => "https://developer.nps.gov/api/v0/alerts?q=#{'park_code'}",
        headers: {:Authorization => ENV['API_KEY']}
      ).execute
      response_1 = JSON.parse(response_1)['data'].sort_by { |i| Date.parse i['releaseDate'] }.reverse.map

      response = RestClient::Request.new(
        :method => :get,
        :url => "https://developer.nps.gov/api/v0/newsreleases?q=#{'park_code'}",
        headers: {:Authorization => ENV['API_KEY']}
      ).execute
      response = JSON.parse(response)['data'].sort_by { |i| i['id'] }.reverse.map
    end
  end
end
