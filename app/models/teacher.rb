class Teacher < ActiveRecord::Base
	belongs_to :country
	belongs_to :province
	belongs_to :city

	has_many :vocationals, :class_name => "TeacherVocational"

  attr_accessible :address, :born_date, :born_place, :city_id, :country_id, :email, :end_title, :first_name, :front_title, :gender, :last_name, :nip, :province_id, :religion, :start_teach

  def self.pagination(page)
    paginate(:per_page => 20, :page => page)
  end

  def gender_name
  	case gender.to_i
  	when 1
  		return "#{I18n.t 'teacher.man'}"
  	when 2
  		return "#{I18n.t 'teacher.woman'}"
  	else
  		return ""
  	end
  end

  def religion_name
    case religion.to_i
    when 1
      return "#{I18n.t 'teacher.islam'}"
    when 2
      return "#{I18n.t 'teacher.christian'}"
    when 3
      return "#{I18n.t 'teacher.catholic'}"
    when 4
      return "#{I18n.t 'teacher.hindu'}"
    when 5
      return "#{I18n.t 'teacher.buddha'}"
    when 6
      return "#{I18n.t 'teacher.konghuchu'}"
    else
      return ""
    end
  end
end
