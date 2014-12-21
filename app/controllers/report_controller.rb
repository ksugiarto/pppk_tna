class ReportController < ApplicationController
	def get_data
    # @service_types = ServiceType.order(:initial)
    # @location_routes = LocationRoute.order(:initial)
    # @customers = Customer.order(:name)
    # @couriers = Employee.courier.order(:nickname)

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
    @events = OrderRequest.filter_order_period(params[:order_start_date], params[:order_end_date])
    .filter_delivered_period(params[:delivery_start_date], params[:delivery_end_date])
    .filter_member(params[:is_member])
    .filter_service_type(params[:service_type_id].to_i)
    .filter_customer(params[:customer_id].to_i)
    .filter_courier(params[:courier_id].to_i)
    .filter_status_report(params[:status])
    .filter_awb(params[:airwaybill_number])
    .order(:or_id)
    .pagination(params[:page])

    @order_requests_pdf = OrderRequest.select("*, order_requests.courier_name as courier_name, order_proof_of_deliveries.receiver")
    .filter_order_period(params[:order_start_date], params[:order_end_date])
    .filter_delivered_period(params[:delivery_start_date], params[:delivery_end_date])
    .filter_member(params[:is_member])
    .filter_service_type(params[:service_type_id].to_i)
    .filter_customer(params[:customer_id].to_i)
    .filter_courier(params[:courier_id].to_i)
    .filter_status_report(params[:status])
    .filter_awb(params[:airwaybill_number])
    .joins("LEFT OUTER JOIN order_proof_of_deliveries ON order_requests.id=order_proof_of_deliveries.order_request_id")
    .order(:or_id)

    if params[:order_start_date].present? && params[:order_end_date].blank?
      @period = ">= #{params[:order_start_date].to_date.strftime('%d-%m-%Y')}" 
    elsif params[:order_start_date].blank? && params[:order_end_date].present?
      @period = "<= #{params[:order_end_date].to_date.strftime('%d-%m-%Y')}" 
    elsif params[:order_start_date].present? && params[:order_end_date].present?
      @period = "#{params[:order_start_date].to_date.strftime('%d-%m-%Y')} s.d. #{params[:order_end_date].to_date.strftime('%d-%m-%Y')}"
    else
      @period = "#{Date.today.strftime("%B %Y")}"
    end

    get_data

    respond_to do |format|
      format.js {  }
      format.pdf do
        pdf = OrderRequestPdf.new(@order_requests_pdf, view_context, ApplicationController.helpers.get_date_print, ApplicationController.helpers.employee_full_name(current_user.id), @period, ApplicationController.helpers.company_name)
        send_data pdf.render, filename: "#{I18n.t 'report.order_request'} #{Time.now.strftime("%Y-%m-%d %H.%M.%S")}.pdf",
        type: "application/pdf", :disposition => "inline"
      end
    end
  end
end
