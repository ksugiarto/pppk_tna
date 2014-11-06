class School < ActiveRecord::Base
	belongs_to :country
	belongs_to :province
	belongs_to :city
	belongs_to :curicculum

  has_many :vocationals, :class_name => "SchoolVocational"
  has_many :requests, :class_name => "SchoolRequest"
	has_many :teachers, :class_name => "Teacher"

  attr_accessible :address, :built_year, :city_id, :country_id, :curicculum_id, :email, :fax, :name, :npsn, :nss, :phone, :province_id, :start_year, :status

  def self.pagination(page)
    paginate(:per_page => 20, :page => page)
  end

  def status_name
  	case status.to_i
  	when 1
  		return "Negeri"
  	when 2
  		return "Swasta"
  	else
  		return ""
  	end
  end
end
