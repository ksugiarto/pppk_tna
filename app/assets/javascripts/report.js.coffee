# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $("#event_pdf").click ->
    title = $("#title").val()
    vocational = $("#vocational").val()
    date_start = $("#date_start").val()
    date_end = $("#date_end").val()
    status = $("#status").val()
    window.open("/report/event_filter?title="+title+"&vocational="+vocational+"&date_start="+date_start+"&date_end="+date_end+"&status="+status+"&format=pdf",'_newtab');