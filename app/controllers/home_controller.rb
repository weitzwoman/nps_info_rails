class HomeController < ApplicationController
  def index
    @messages = Message.get_new_releases
    @alerts = Message.get_alerts
  end

  def show(park_code)
    @search = Message.search(park_code)
  end
end
