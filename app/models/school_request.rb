class SchoolRequest < ActiveRecord::Base
	belongs_to :school

	has_many :participants, :class_name => "RequestParticipant"
	has_many :vocationals, :class_name => "RequestVocational"
	
  attr_accessible :notes, :reference_number, :request_date, :school_id

  def self.filter_reference(reference)
    if reference.present?
      where("reference_number ~* ?", reference)
    else
      scoped
    end
  end

  def self.filter_request_date(start_date, end_date)
    if start_date.present? and end_date.blank?
      where("request_date >= ?", start_date)
    elsif start_date.blank? and end_date.present?
      where("request_date <= ?", "#{end_date} 23:59:59")
    elsif start_date.present? and end_date.present?
      where("request_date BETWEEN ? AND ?", start_date, "#{end_date} 23:59:59")
    else
      # where("EXTRACT(MONTH FROM request_date)=EXTRACT(MONTH FROM CURRENT_DATE)")
      scoped
    end
  end
end
