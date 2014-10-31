class School < ActiveRecord::Base
	belongs_to :country
	belongs_to :province
	belongs_to :city
	belongs_to :curicculum

	# has_many :basic_competencies, :class_name => "BasicCompetency"

  attr_accessible :address, :built_year, :city_id, :country_id, :curicculum_id, :email, :fax, :name, :npsn, :nss, :phone, :province_id, :start_year, :status
end
