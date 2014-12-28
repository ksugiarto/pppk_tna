module ApplicationHelper
	def company_name
    # company_name = CompanyProfile.last.try(:name)
    return CompanyProfile.last.try(:name)
    # return "PPPK TNA"
  end

  def get_date_print
    date_print = Date.today.strftime("%d-%m-%Y")
  end

  def date(d)
    if d.present?
    	return d.to_time.localtime.strftime("%d-%m-%Y")
    else
      return d
    end
  end

  def precision(num)
  	return number_with_precision(num.to_f, :delimiter => ",", :separator => ".", :precision => 0)
  end

  def round_precision(num)
  	return number_with_precision(num.to_f, :delimiter => ",", :separator => ".", :precision => 0)
  end

  def delimiter(num)
  	return number_with_delimiter(num.to_f, :delimiter => ",", :separator => ".")
  end

  def event_class(id)
    case id
    when 0
      label = "label label-default"
    when 1
      label = "label label-success"
    when 5
      label = "label label-danger"
    else label = ""
    end
  end

  def label_class(id)
    case id
    when 0
      label = "label label-default"
    when 1
      label = "label label-warning"
    when 5
      label = "label label-inverse"
    when 7
      label = "label label-success"
    when 8
      label = "label label-danger"
    else label = ""
    end
  end

  def get_row_number(page)
    @number=0
    (1..@page).each do |i|
      @number+=10
    end

    return @number
  end
end
