class HomeController < ApplicationController
  def index
    @messages = Message.get_news_releases
    @alerts = Message.get_alerts
    if params['q']
      @messages = Message.search_news(params['q'])
      @alerts = Message.search_alert(params['q'])
    end
  end

  def search
    redirect_to 'home#index'
  end
end
