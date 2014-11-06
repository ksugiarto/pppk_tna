class Teacher < ActiveRecord::Base
	belongs_to :country
	belongs_to :province
	belongs_to :city

	has_many :vocationals, :class_name => "TeacherVocational"

  attr_accessible :address, :born_date, :born_place, :city_id, :country_id, :email, :end_title, :first_name, :front_title, :gender, :last_name, :nip, :province_id, :religion, :start_teach
end
