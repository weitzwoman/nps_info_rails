class HomeController < ApplicationController
  def index
    @pre_messages = Message.get_new_releases
    @messages = @pre_messages['data']
    @alert_messages = Message.get_alerts
    @alerts = @alert_messages['data']
  end
end
