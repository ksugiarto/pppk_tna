class Event < ActiveRecord::Base
  belongs_to :vocational

  attr_accessible :date_end, :date_start, :description, :name, :status, :vocational_id

  def self.pagination(page)
    paginate(:per_page => 20, :page => page)
  end
end
