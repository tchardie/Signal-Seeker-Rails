#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Datum.create(:location => '30.847425176936532, -83.28771829605103',
:wifi => '1', :cell => '1', :carrier => 'Sprint',
:gmaps => 'true', :latitude => '30.847425176936532', :longitude => '-83.28771829605103')

Datum.create(:location => '30.848539712297395, -83.28907012939453',
:wifi => '2', :cell => '2', :carrier => 'Att',
:gmaps => 'true', :latitude => '30.848539712297395', :longitude => '-83.28907012939453')

Datum.create(:location => '30.850271361383978, -83.28949928283691',
:wifi => '3', :cell => '3', :carrier => 'Verizon',
:gmaps => 'true', :latitude => '30.850271361383978', :longitude => '-83.28949928283691')
