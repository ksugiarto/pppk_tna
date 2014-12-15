class School < ActiveRecord::Base
	belongs_to :country
	belongs_to :province
	belongs_to :city
	belongs_to :curicculum

  has_many :vocationals, :class_name => "SchoolVocational"
  has_many :requests, :class_name => "SchoolRequest"
	has_many :teachers, :class_name => "Teacher"

  attr_accessible :address, :built_year, :city_id, :country_id, :curicculum_id, :email, :fax, :name, :npsn, :nss, :phone, :province_id, :start_year, :status

  def self.pagination(page)
    paginate(:per_page => 20, :page => page)
  end

  def status_name
  	case status.to_i
  	when 1
  		return "Negeri"
  	when 2
  		return "Swasta"
  	else
  		return ""
  	end
  end

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]

      city = City.where("name ~* ?", row["Kota"]).last
      if city.blank?
        country = Country.find_by_name("Indonesia")
        if country.blank?
          country = Country.create(:name => "Indonesia")
        end
        province = Province.find_by_name("Jawa Timur")
        if province.blank?
          province = country.provinces.create(:name => "Jawa Timur")
        end

        city = City.create(:country_id => country.id, :province_id => province.id, :name => row["Nama"])
      else
        province = Province.find(city.try(:province_id))
        country = Country.find(province.try(:country_id))
      end

      curicculum = Curicculum.where("name ~* ?", row["Kurikulum"]).last
      if curicculum.blank?
        curicculum = Curicculum.create(:name => row["Kurikulum"])
      end

      school = School.where("name ~* ?", row["Nama"]).last
      if school.blank?
        school = School.create(:name => row["Nama"], :address => row["Alamat"], :country_id => country.id, :province_id => province.id, :city_id => city.id, :curicculum_id => curicculum.id)
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
