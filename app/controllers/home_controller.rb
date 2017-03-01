class HomeController < ApplicationController
  def index
    @messages = Message.get_new_releases
    
  end
end
