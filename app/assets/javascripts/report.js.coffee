# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $("#event_pdf").click ->
    order_start_date = $("#order_start_date").val()
    order_end_date = $("#order_end_date").val()
    delivery_start_date = $("#delivery_start_date").val()
    delivery_end_date = $("#delivery_end_date").val()
    is_member = $("#is_member").val()
    service_type_id = $("#service_type_id").val()
    customer_id = $("#customer_id").val()
    courier_id = $("#courier_id").val()
    airwaybill_number = $("#airwaybill_number").val()
    status = $("#status").val()
    window.open("/report/order_request_filter?order_start_date="+order_start_date+"&order_end_date="+order_end_date+"&delivery_start_date="+delivery_start_date+"&delivery_end_date="+delivery_end_date+"&is_member="+is_member+"&service_type_id="+service_type_id+"&customer_id="+customer_id+"&courier_id="+courier_id+"&status="+status+"&airwaybill_number="+airwaybill_number+"&format=pdf",'_newtab');