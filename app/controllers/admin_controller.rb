class AdminController < ApplicationController
  def index
    @total_data = Data.count
  end

end