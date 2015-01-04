class ExamPdf < Prawn::Document
  def initialize(event_id, event_exam_id, company_name, date_print, view)
  super()
    @event = Event.find(event_id)
    @event_exam = @event.exams.find(event_exam_id)
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

  def logo
    # logopath =  "#{Rails.root}/public/assets/company_logo/logo.png"
    # image logopath, :width => 110, :height => 60, :position => :center, :vposition => :top
  end

  def header
    font("Times-Roman", :size => 11) do
      text "SOAL UJIAN PELATIHAN", :align => :center, :style => :bold
      text "UPT. Pelatihan dan Pengembangan Pendidikan Kejuruan", :align => :center, :style => :bold
      text "#{I18n.t 'vocational.vocational'}: #{@event.try(:vocational).try(:full_name)}", :align => :center
      text "#{I18n.t 'event_exam.event_exam'}: #{@event_exam.exam_type}", :align => :center
    end

    stroke do
      horizontal_rule
    end
  end

  def questions
    @number = 0

    @event_exam.questions.order(:id).map do |question|
      [ "#{@number+=1}.", "#{question.content}
        a. #{question.answer_1}
        b. #{question.answer_2}
        c. #{question.answer_3}
        d. #{question.answer_4}" ]
    end

  end

  def content
    table questions, :cell_style => { :font => "Times-Roman", :size => 11 }, :width => 540 do
      cells.borders=[]
      self.column_widths = {0=>20, 1=>520}
    end
  end

  def footer
    move_down 10

    repeat(:all) do
      stroke do
        horizontal_line 0, 540, :at => 2
      end

      number_pages "[#{I18n.t 'event_exam.event_exam'} - #{I18n.t 'event_exam.exam_type'}: #{@event_exam.exam_type}]", :size => 5, :at => [0, 0]
    end
    number_pages "(<page>/<total>)", :size => 5, :at => [520, 0]
  end
end