class Vocational < ActiveRecord::Base
	belongs_to :curicculum
	has_many :core_competencies, :class_name => "CoreCompetency"

  attr_accessible :class_for, :curicculum_id, :name

  def self.pagination(page)
    paginate(:per_page => 20, :page => page)
  end
end
