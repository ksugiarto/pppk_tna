class Teacher < ActiveRecord::Base
	belongs_to :country
	belongs_to :province
  belongs_to :city
	belongs_to :school

  has_many :vocationals, :class_name => "TeacherVocational"
  has_many :histories, :class_name => "TeacherHistory"
	has_many :subjects, :class_name => "TeacherSubject"

  attr_accessible :address, :born_date, :born_place, :city_id, :country_id, :email, :end_title, :first_name, :front_title, :gender, :last_name, :nip, :province_id, :religion, :school_id, :start_teach

  def self.pagination(page)
    paginate(:per_page => 20, :page => page)
  end

  def full_name
    if end_title.blank?
      "#{front_title} #{first_name} #{last_name}"
    elsif last_name.blank?
      "#{front_title} #{first_name}, #{end_title}"
    else
      "#{front_title} #{first_name} #{last_name}, #{end_title}"
    end
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

  def full_address
    if city_id.to_i==0 
      "#{address}"
    else
      "#{address}, #{city.try(:name)}"
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
    when 7
      return "#{I18n.t 'teacher.other'}"
    else
      return ""
    end
  end

  def self.filter_nip(nip)
    if nip.present?
      where("nip ~* '#{nip}'")
    else
      scoped
    end
  end

  def self.filter_name(name)
    if name.present?
      where("first_name ~* ? OR last_name ~* ?", name, name)
    else
      scoped
    end
  end

  def self.filter_school(school)
    if school.present?
      joins(:school).where("schools.name ~* '#{school}'")
    else
      scoped
    end
  end
end
