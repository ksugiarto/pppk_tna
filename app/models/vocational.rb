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
end
