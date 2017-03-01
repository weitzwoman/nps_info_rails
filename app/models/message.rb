class Message < ApplicationRecord
  before_create :get_new_releases
  before_create :get_alerts


# singletons
  class << self
    def get_new_releases
      response = RestClient::Request.new(
        :method => :get,
        :url => "https://developer.nps.gov/api/v0/newsreleases?parkCode=yell",
        headers: {:Authorization => ENV['API_KEY']}
      ).execute
      response = JSON.parse(response)
    end

    def get_alerts
      response = RestClient::Request.new(
        :method => :get,
        :url => "https://developer.nps.gov/api/v0/alerts?parkCode=yose",
        headers: {:Authorization => ENV['API_KEY']}
      ).execute
      response = JSON.parse(response)
    end
  end
end
