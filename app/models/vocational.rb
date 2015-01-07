class Vocational < ActiveRecord::Base
	belongs_to :curicculum
	has_many :core_competencies, :class_name => "CoreCompetency"

  attr_accessible :class_for, :curicculum_id, :name

  def self.pagination(page)
    paginate(:per_page => 20, :page => page)
  end

  def full_name
  	"#{name} - #{I18n.t 'vocational.class_for'} #{class_for}"
  end

  def self.last_event(vocational_id)
  	date = Event.where(:vocational_id => vocational_id).order(:date_start).last.try(:date_start)
  	if date.present?
	  	if date >= Date.today
	  		return "> #{ApplicationController.helpers.date(date)}"
	  	elsif date < Date.today
	  		return "< #{ApplicationController.helpers.date(date)}"
	  	else
	  		return ""
	  	end
  	end
  end

  def self.teacher_count(vocational_id)
		return TeacherVocational.where(:vocational_id => vocational_id).count.to_i
  end
end
