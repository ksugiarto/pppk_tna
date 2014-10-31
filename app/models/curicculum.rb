class Curicculum < ActiveRecord::Base
	has_many :vocationals, :class_name => "Vocational"

  attr_accessible :description, :name
end
