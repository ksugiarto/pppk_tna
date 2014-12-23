class UserGroup < ActiveRecord::Base
  attr_accessible :name

  def self.pagination(page)
    paginate(:per_page => 15, :page => page)
  end
end
