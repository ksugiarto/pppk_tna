// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require jquery.remotipart
//= require best_in_place
//= require fullcalendar
//= require moment
//= require_tree .
//= require_self

// require fullcalendar/gcal
jQuery.ajaxSetup({
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})

$.fn.ajaxSelect = function(rel) {
  var that = this;

  this.change(function() {
    $.get(rel, {id: that.val()}, null, "script");
  });
}

$.fn.ajaxChange = function(rel) {
  var that = this;

  $.get(rel, {id: that.val()}, null, "script");
  return false;
}

$.fn.keyUp = function(rel) {
  var that = this;

  this.keyup(function() {
    $.get(rel, {id: that.val()}, null, "script");
  })
}

$.fn.onLoad = function(rel) {
  var that = this;

  this.ready(function() {
    $.get(rel, {id: that.val()}, null, "script");
  })
}

$.fn.ajaxPagination = function() {
  this.on("click", function () {
    $(".apple_pagination").html("Silahkan tunggu...")
    $.get(this.href, null, null, "script");
    return false;
  });
}

$(document).ready(function() {
  /* Activating Best In Place */
  // jQuery(".best_in_place").best_in_place();

  $(".apple_pagination a").ajaxPagination();
  $(".best_in_place").best_in_place();

  window.setTimeout(function() {
    $(".alert").fadeTo(500, 0).slideUp(500, function(){
      $(this).remove(); 
    });
  }, 10000);

  $(function () {
    $('.checkall').on('click', function () {
        $(this).closest('fieldset').find(':checkbox').prop('checked', this.checked);
    });
  });

  $('.modal').on('shown.bs.modal', function() {
    $(this).find('[autofocus]').focus();
  });

  $( "#datepicker" ).datepicker({
    changeMonth: true,
    changeYear: true
  });
  $( "#datepicker" ).datepicker( "option", "dateFormat", "yy-mm-dd" );

  $('#calendar').fullCalendar({
    events: "/events/pick_date.json",
    selectable: true,
    // lang: 'id',

    dayClick: function(date, jsEvent, view) {
        // alert('Clicked on: ' + date.format());
        // alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
        // alert('Current view: ' + view.title);
        // window.location.href = "/events/new?date_start=" + date.format();

        // change the day's background color just for fun
        // $(this).css('background-color', 'red');
    },

    select: function( start, end, jsEvent, view ) {
      if(start < new Date())
      {
          alert("Silahkan pilih tanggal setelah hari ini.");
      }
      else
      {
        var id = $("#event_id").html();
        window.location.href = "/events/" + id + "/save_date?date_start=" + start.format() + "&date_end=" + end.format();
      }
    }
  });
});