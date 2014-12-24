class EventIndividualPdf < Prawn::Document
  def initialize(event_id, company_name, date_print, view)
  # super(:page_layout => :landscape)
  super()
    @event = Event.find(event_id)
    @company_name = company_name
    @date_print = date_print
    @view = view
    header
    content
    footer
  end

  def precision(num)
    @view.number_with_precision(num.to_f, :delimiter => ",", :separator => ".", :precision => 2)
  end

  def precision_zero(num)
    @view.number_with_precision(num.to_f, :delimiter => ",", :separator => ".", :precision => 0)
  end

  def delimiter(num)
    @view.number_with_delimiter(num.to_f, :delimiter => ",", :separator => ".")
  end

  def date(d)
    if d.present?
      return d.to_time.localtime.strftime("%d-%m-%Y")
    else
      return d
    end
  end

  def logo
    # logopath =  "#{Rails.root}/public/assets/company_logo/logo.png"
    # image logopath, :width => 110, :height => 60, :position => :center, :vposition => :top
  end

  def check_mark
    # logopath =  "#{Rails.root}/app/assets/images/heavy_check_mark.png"
    # image logopath, :width => 10, :height => 10, :position => :center, :vposition => :top
  end

  def header
    font("Times-Roman") do
      number_pages "" # dunno just make the formatting right
      text "#{@company_name}", :align => :center, :size => 10, :style => :bold
      # text "#{I18n.t 'event.report'}", :align => :center, :size => 8, :style => :bold
      # text "#{I18n.t 'report.period'}: #{@period}", :align => :center, :size => 7
    end

    stroke do
      self.line_width = 1
      horizontal_line 0, 540, :at => 690
      move_down 20
    end
  end

  def event_info
    [["#{I18n.t 'event.title'}", ": ", @event.title, "#{I18n.t 'event.vocational'}", ": ", @event.vocational.try(:full_name)],
     ["#{I18n.t 'event.date_start'}", ": ", date(@event.date_start), "#{I18n.t 'event.date_end'}", ": ", date(@event.date_end)], 
     ["#{I18n.t 'event.description'}", ": ", @event.description, "", "", ""]]
  end

  def event_prerequisites
    [["#{I18n.t 'event_prerequisite.min_age'}", "#{I18n.t 'event_prerequisite.max_age'}", 
      "#{I18n.t 'event_prerequisite.max_event_count'}", "#{I18n.t 'event_prerequisite.min_long_teach'}", "#{I18n.t 'event_prerequisite.max_long_teach'}" ]] +
    @event.prerequisites.map do |event_prerequisite|
      [ event_prerequisite.min_age, event_prerequisite.max_age, 
        event_prerequisite.max_event_count, event_prerequisite.min_long_teach, event_prerequisite.max_long_teach ]
    end
  end

  def event_participants
    @number = 0

    [["#{I18n.t 'row_number'}", "#{I18n.t 'event_participant.teacher'}", "#{I18n.t 'event_participant.total_presence'}", 
      "#{I18n.t 'event_participant.exam'}", "#{I18n.t 'event_participant.exam_grade'}", "#{I18n.t 'event_participant.status'}" ]] +
    @event.participants.map do |event_participant|
      [ "#{@number+=1}.", event_participant.teacher.try(:full_name), event_participant.total_presence, 
        event_participant.event_exam.try(:exam_type), event_participant.exam_grade, event_participant.status_name ]
    end
  end

  def content
    table event_info, :cell_style => { :font => "Times-Roman", :size => 10, :height => 18 }, :width => 540 do
      self.column_widths = {0=>60, 1=>20, 2=>200, 3=>60, 4=>20, 5=>180}
      cells.borders = []
      columns(0).font_style = :bold
      columns(0..1).font_style = :bold
      columns(3..4).font_style = :bold
    end

    move_down 10

    table event_prerequisites, :cell_style => { :font => "Times-Roman", :size => 10, :height => 18 }, :width => 540 do
      self.column_widths = {0=>110, 1=>110, 2=>110, 3=>100, 4=>110}
      # cells.borders = []
      self.row_colors = ["FFFFFF", "F5F5F5"]
      row(0).background_color = "708DC6"
      rows(0).font_style = :bold
    end

    move_down 20

    table event_participants, :cell_style => { :font => "Times-Roman", :size => 10, :height => 18 }, :width => 540 do
      self.column_widths = {0=>30, 1=>250, 2=>60, 3=>70, 4=>60, 5=>70}
      # cells.borders = []
      self.row_colors = ["FFFFFF", "F5F5F5"]
      row(0).background_color = "708DC6"
      rows(0).font_style = :bold
    end
  end

  def footer
    move_down 10

    repeat(:all) do
      stroke do
        horizontal_line 0, 540, :at => 2
      end

      number_pages "[#{I18n.t 'event.event'} - #{I18n.t 'report.date_print'}: #{@date_print}]", :size => 5, :at => [0, 0]
    end
    number_pages "(<page>/<total>)", :size => 5, :at => [520, 0]
  end
end