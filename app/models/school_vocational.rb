class SchoolVocational < ActiveRecord::Base
	belongs_to :school
	belongs_to :vocational

  attr_accessible :notes, :school_id, :vocational_id
end
