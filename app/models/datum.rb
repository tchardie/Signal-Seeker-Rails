class Datum < ActiveRecord::Base
  acts_as_gmappable
  def gmaps4rails_address
    address
  end

  def gmaps4rails_infowindow
    "<h4>Location: #{location}<br />Latitude: #{latitude}<br />Longitude: #{longitude}</h4>" << "<h4>#{carrier}<br />Wifi signal: #{wifi}<br />Cell signal: #{cell}</h4>"
  end

  def gmaps4rails_marker_picture
    {
      "picture" => "images/#{wifi}.png",
      "width" =>  "40",          # string, mandatory
      "height" => "37"     # string, mandatory
    }
  end

  CARRIER_TYPES = ["Sprint", "Att", "Verizon", "T-Mobile"]
  SIGNAL_STRENGTH = [0, 1, 2, 3, 4]
  
  validates :address, :presence => true
  validates :wifi, :presence => true
  validates :cell, :presence => true
end
