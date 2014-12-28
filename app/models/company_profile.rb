class CompanyProfile < ActiveRecord::Base
	belongs_to :city

  attr_accessible :address, :city_id, :full_name, :name, :logo

  has_attached_file :logo, :styles => { :small => "150x150>" },
                    :url  => "/images/company_logo//logo.png",
                    :path => ":rails_root/public/images/company_logo/logo.png"
end
