# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# LOCATION SETTING
indonesia = Country.create(:name => "Indonesia", :country_ext => "+62")
jawa_timur = indonesia.provinces.create(:name => "Jawa Timur")
jawa_tengah = indonesia.provinces.create(:name => "Jawa Tengah")
jawa_barat = indonesia.provinces.create(:name => "Jawa Barat")
surabaya = City.create(:country_id => indonesia.id, :province_id => jawa_timur.id, :name => "Surabaya", :city_ext => "31")
City.create(:country_id => indonesia.id, :province_id => jawa_timur.id, :name => "Pandaan", :city_ext => "343")
City.create(:country_id => indonesia.id, :province_id => jawa_tengah.id, :name => "Purwodadi", :city_ext => "292")
ponorogo = City.create(:country_id => indonesia.id, :province_id => jawa_timur.id, :name => "Ponorogo", :city_ext => "352")
semarang = City.create(:country_id => indonesia.id, :province_id => jawa_tengah.id, :name => "Semarang", :city_ext => "24")
bandung = City.create(:country_id => indonesia.id, :province_id => jawa_barat.id, :name => "Bandung", :city_ext => "22")
# END LOCATION SETTING