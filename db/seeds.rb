# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# LOCATION SETTING
indonesia = Country.create(:name => "Indonesia", :country_ext => "+62")
jawa_timur = indonesia.provinces.create(:name => "Jawa Timur")
jawa_tengah = indonesia.provinces.create(:name => "Jawa Tengah")
jawa_barat = indonesia.provinces.create(:name => "Jawa Barat")
surabaya = City.create(:country_id => indonesia.id, :province_id => jawa_timur.id, :name => "Surabaya", :city_ext => "31")
City.create(:country_id => indonesia.id, :province_id => jawa_timur.id, :name => "Pandaan", :city_ext => "343")
City.create(:country_id => indonesia.id, :province_id => jawa_tengah.id, :name => "Purwodadi", :city_ext => "292")
ponorogo = City.create(:country_id => indonesia.id, :province_id => jawa_timur.id, :name => "Ponorogo", :city_ext => "352")
semarang = City.create(:country_id => indonesia.id, :province_id => jawa_tengah.id, :name => "Semarang", :city_ext => "24")
bandung = City.create(:country_id => indonesia.id, :province_id => jawa_barat.id, :name => "Bandung", :city_ext => "22")
# END LOCATION SETTING

# COMPETENCIES
ktsp = Curicculum.create(:name => "KTSP", :description => "Kurikulum KTSP")
fisika = ktsp.vocationals.create(:name => "Fisika", :class_for => "X")
fisika = ktsp.vocationals.create(:name => "Fisika", :class_for => "XI")
fisika = ktsp.vocationals.create(:name => "Fisika", :class_for => "XII")
core = fisika.core_competencies.create(:seq_num => 1, :description => "Memahami,menerapkan, menganalisis pengetahuan faktual, konseptual, prosedural berdasarkan rasa ingintahunya tentang ilmu pengetahuan, teknologi, seni, budaya, dan humaniora dengan baik.")
core.basic_competencies.create(:seq_num => 1, :description => "Menganalisis Q.S. Al-Anfal (8) : 72); Q.S. Al-Hujurat (49) : 12; dan QS Al- Hujurat (49) : 10; serta hadits tentang kontrol diri (mujahadah an-nafs), prasangka baik (husnuzzhan), dan persaudaraan (ukhuwah)")
core.basic_competencies.create(:seq_num => 2, :description => "Memahami manfaat dan hikmah kontrol diri (mujahadah an-nafs), prasangka baik (husnuzzhan) dan persaudaraan (ukhuwah), dan menerapkannya dalam kehidupan")
# END COMPETENCIES

frateran = School.create(:nss => "123456", :npsn => "123456", :name => "SMK Frateran", :status => 2, :address => "Kepanjen 123", :city_id => surabaya.id, :province_id => jawa_timur.id, :country_id => indonesia.id, :phone => "031789456", :fax => "031654987", :email => "lo6einsteins@live.com", :curicculum_id => ktsp.id, :built_year => "2000", :start_year => "2000")
smk = School.create(:nss => "654321", :npsn => "654312", :name => "SMK 2 Surabaya", :status => 1, :address => "Arief Hakim 456", :city_id => surabaya.id, :province_id => jawa_timur.id, :country_id => indonesia.id, :phone => "031555556", :fax => "0312489756", :email => "lo6einsteins@live.com", :curicculum_id => ktsp.id, :built_year => "2005", :start_year => "2006")

agus = Teacher.create(:school_id => smk.id, :nip => "196608282005011008", :front_title => "Drs.", :first_name => "Agus", :last_name => "Dwiaji", :end_title => "", :born_place => "Surabaya", :born_date => "1978-01-12", :gender => 1, :email => "", :religion => 1, :address => "JL Gresik 45", :city_id => surabaya.id, :province_id => jawa_timur.id, :country_id => indonesia.id, :start_teach => "1995")
zulkarnain = Teacher.create(:school_id => smk.id, :nip => "197107032006041027", :front_title => "", :first_name => "Zulkarnain", :last_name => "", :end_title => "S.Pd.", :born_place => "Surabaya", :born_date => "1978-01-12", :gender => 1, :email => "", :religion => 2, :address => "JL Malang 12", :city_id => surabaya.id, :province_id => jawa_timur.id, :country_id => indonesia.id, :start_teach => "1995")
zulkarnain = Teacher.create(:school_id => frateran.id, :nip => "197208212005041012", :front_title => "", :first_name => "Anugerah", :last_name => "Budi", :end_title => "S.ST.", :born_place => "Surabaya", :born_date => "1958-10-24", :gender => 1, :email => "", :religion => 3, :address => "JL Porong 01", :city_id => surabaya.id, :province_id => jawa_timur.id, :country_id => indonesia.id, :start_teach => "1992")