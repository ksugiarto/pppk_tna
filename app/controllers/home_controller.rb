class HomeController < ApplicationController
  def index
    @incoming_events = Event.where("date_start > ? AND status = ?", Date.today, 0).order(:date_start)
    @due_events = Event.where("date_start <= ? AND status = ?", Date.today, 0).order(:date_start)
  end

  def provinces_by_country
  	if params[:id].present?
  		country = Country.find(params[:id])
  		@provinces = country.provinces.order(:name)
    else
      @provinces = Province.order(:name)
    end
    @cities = [] #probably need to be updated further

  	respond_to do |format|
  		format.js
  	end
  end

  def cities_by_province
  	if params[:id].present?
  		province = Province.find(params[:id])
  		@cities = province.cities.order(:name)
  	else
  		@cities = City.order(:name)
  	end

  	respond_to do |format|
  		format.js
  	end
  end
end
