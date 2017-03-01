class Message < ApplicationRecord

# singletons
  class << self
    def get_news_releases
      response = RestClient::Request.new(
        :method => :get,
        :url => "https://developer.nps.gov/api/v0/newsreleases?limit=10",
        headers: {:Authorization => ENV['API_KEY']}
      ).execute
      # response =JSON.parse(response)
      response =JSON.parse(response)['data'].sort_by { |i| Date.parse i['releaseDate'] }.reverse.map
    end

    def get_alerts
      response = RestClient::Request.new(
        :method => :get,
        :url => "https://developer.nps.gov/api/v0/alerts?limit=10",
        headers: {:Authorization => ENV['API_KEY']}
      ).execute
      response = JSON.parse(response)['data'].sort_by { |i| i['id']}.reverse.map
    end

    def search_news(q)
      response = RestClient::Request.new(
        :method => :get,
        :url => "https://developer.nps.gov/api/v0/newsreleases?q=#{q}",
        headers: {:Authorization => ENV['API_KEY']}
      ).execute
      response = JSON.parse(response)['data'].sort_by { |i| Date.parse i['releaseDate'] }.reverse.map
    end

    def search_alert(q)
      response_1 = RestClient::Request.new(
        :method => :get,
        :url => "https://developer.nps.gov/api/v0/alerts?q=#{q}",
        headers: {:Authorization => ENV['API_KEY']}
      ).execute
      response_1 = JSON.parse(response_1)['data'].sort_by { |i| i['id'] }.reverse.map
    end
  end
end
