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

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]

      country = Country.where("name ~* ?", row["Negara"]).last
      province = Province.where("name ~* ?", row["Provinsi"]).last

      if country.blank?
        country = Country.create(:name => row["Negara"])
      end

      if province.blank?
        province = country.provinces.create(:name => row["Provinsi"])
      end

      city = City.where("name ~* ?", row["Nama"]).last
      if city.blank?
        city = City.create(:country_id => country.id, :province_id => province.id, :name => row["Nama"], :city_ext => "#{row["Kode Area"]}")
      else
        city.update_attributes(:city_ext => "#{row['Kode Area']}")
      end
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when '.csv' then Roo::Csv.new(file.path, nil, :ignore)
    when '.xls' then Roo::Excel.new(file.path, nil, :ignore)
    when '.xlsx' then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
end
