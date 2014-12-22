class EventReportPdf < Prawn::Document
  def initialize(models, period, company_name, date_print, view)
  super()
    @models = models
    @period = period
    @company_name = company_name
    @date_print = date_print
    @view = view
    header
    content
    footer
  end

  def precision(num)
    @view.number_with_precision(num, :delimiter => ",", :separator => ".", :precision => 0)
  end

  def delimiter(num)
    @view.number_with_delimiter(num, :delimiter => ",", :separator => ".")
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
      text "#{I18n.t 'event.report'}", :align => :center, :size => 8, :style => :bold
      text "#{I18n.t 'report.period'}: #{@period}", :align => :center, :size => 7
    end

    stroke do
      self.line_width = 1
      horizontal_line 0, 540, :at => 690
      move_down 10
    end
  end

  def model_item_rows
    @number = 0

    [["#{I18n.t 'row_number'}", "#{I18n.t 'event.title'}", "#{I18n.t 'event.vocational'}", 
      "#{I18n.t 'event.date_start'}", "#{I18n.t 'event.date_end'}", "#{I18n.t 'event.status_short'}" ]] +
    @models.map do |model|
      [ "#{@number+=1}.", "#{model.title}", "#{model.vocational.try(:name)}", 
        "#{date(model.date_start)}", "#{date(model.date_end)}", "#{model.status_name}" ]
    end
  end

  def content
    table model_item_rows, :cell_style => { :font => "Times-Roman", :size => 6 }, :width => 540 do
      self.header = true
      self.row_colors = ["FFFFFF", "F5F5F5"]
      self.column_widths = {0=> 20, 1=>160, 2=>180, 3=>60, 4=>60, 5=>60}
      row(0).font_style = :bold
      row(0).background_color = "708DC6"
      column(0).align = :right
      column(6).align = :right
    end
  end

  def footer
    move_down 10

    repeat(:all) do
      stroke do
        horizontal_line 0, 540, :at => 2
      end

      number_pages "[#{I18n.t 'event.report'} - #{I18n.t 'report.date_print'}: #{@date_print}]", :size => 5, :at => [0, 0]
    end
    number_pages "(<page>/<total>)", :size => 5, :at => [520, 0]
  end
end