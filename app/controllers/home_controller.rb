class HomeController < ApplicationController
  skip_before_filter :authorize
  
  def index
      @time = Time.now.strftime("%H:%M %m-%d-%y ")
      @data = Datum.all
      @json = Datum.all.to_gmaps4rails
  end

end
