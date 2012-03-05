class Datum < ActiveRecord::Base
  acts_as_gmappable
  def gmaps4rails_address
    address
  end

  def gmaps4rails_infowindow
    "<h4>Latitude: #{latitude}<br />Longitude: #{longitude}</h4>" << "<h4>#{carrier}<br />Wifi: #{wifi}<br />Cell: #{cell}</h4>"
  end

  def gmaps4rails_marker_picture
    {
      "picture" => "images/#{wifi}.png",
      "width" =>  "32",          # string, mandatory
      "height" => "32"     # string, mandatory
    }
  end

  CARRIER_TYPES = ["Sprint", "At&t", "Verizon", "T-Mobile"]

  validates :wifi, :numericality => {:greater_than_or_equal_to => 0}
  validates :cell, :numericality => {:greater_than_or_equal_to => 0}
end
