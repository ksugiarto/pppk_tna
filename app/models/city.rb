class City < ActiveRecord::Base
  belongs_to :country
  belongs_to :province

  before_create :default_country_province

  attr_accessible :country_id, :province_id, :city_ext, :name

  def self.pagination(page)
    paginate(:per_page => 20, :page => page)
  end

  def default_country_province
    indonesia = Country.where("name ~* 'indonesia'").first
    if indonesia.blank?
      indonesia = Country.create(:name => "Indonesia", :country_ext => "+62")
    end
    jatim = indonesia.provinces.where("name ~* 'jawa timur'").first
    if jatim.blank?
      jatim = indonesia.provinces.create(:name => "Jawa Timur")
    end

    return @indonesia_id=indonesia.id, @jatim_id=jatim.id
  end

  def self.city_name(id)
  	if id.present?
  		name = City.find(id).try(:name)
  	else
  		name = ""
  	end
  end

  def self.filter_country(id)
    if id.present?
      where(:country_id => id)
    else
      scoped
    end
  end

  def self.filter_province(id)
    if id.present?
      where(:province_id => id)
    else
      scoped
    end
  end

  def self.filter_name(name)
    if name.present?
      where("name ~* '#{name}'")
    else
      scoped
    end
  end
end
