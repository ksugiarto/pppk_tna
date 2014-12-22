class ReportController < ApplicationController
	def get_data
    @page = params[:page].to_i - 1
  end

	def event
    @events = Event
    .where("EXTRACT(MONTH FROM date_start)=EXTRACT(MONTH FROM CURRENT_DATE)")
    .order(:date_start)
    .pagination(params[:page])

    get_data

    respond_to do |format|
      format.html
      format.js
    end
  end

  def event_filter
    @events = Event
    .filter_title(params[:title])
    .filter_vocational(params[:vocational])
    .filter_event_date(params[:date_start], params[:date_end])
    .filter_status(params[:status])
    .order(:date_start)
    .pagination(params[:page])

    if params[:date_start].present? && params[:date_end].blank?
      @period = ">= #{params[:date_start].to_date.strftime('%d-%m-%Y')}" 
    elsif params[:date_start].blank? && params[:date_end].present?
      @period = "<= #{params[:date_end].to_date.strftime('%d-%m-%Y')}" 
    elsif params[:date_start].present? && params[:date_end].present?
      @period = "#{params[:date_start].to_date.strftime('%d-%m-%Y')} s.d. #{params[:date_end].to_date.strftime('%d-%m-%Y')}"
    else
      @period = "#{Date.today.strftime("%B %Y")}"
    end

    get_data

    respond_to do |format|
      format.js
      format.pdf do
        pdf = EventReportPdf.new(@events, @period, ApplicationController.helpers.company_name, ApplicationController.helpers.get_date_print, view_context)
        send_data pdf.render, filename: "#{I18n.t 'event.report'} #{I18n.l Time.now.localtime, :format => '%Y-%m-%d %H-%M-%S'}.pdf",
        type: "application/pdf", :disposition => "inline"
      end
    end
  end
end
