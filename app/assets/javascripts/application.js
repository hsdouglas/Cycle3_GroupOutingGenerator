// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


function splitEvents(a) {
  var returnArray = [ [] ]
  var currentDate = new Date(Date.now())
  var returnArrayIndex = 0;
  $.each(a, function(index, value) {
    if(currentDate.getDay() != (new Date(value.start)).getDay()) {
      currentDate = new Date(value.start)
      returnArray.push([])
      returnArrayIndex++
    }
    returnArray[returnArrayIndex].push(value);
  })
  return returnArray
}

function getLocationDetails(e) {
  details = ""
  details += (new Date(e.start)).toTimeString()
  details += " at "
  details += e.venue_title
  return details
}

function getAttendanceDetails(e) {
  if(e.purchased_tickets === 1) {
    return "There is currently 1 person attending"
  }
  else {
    return "There are currently " + e.purchased_tickets + " people attending"
  }
}

function makeEvent(e) {
  $event = $("<div>").addClass("event")
  $event.append($("<div>")
        .addClass("event-image")
        .append($("<img/>", {src: e.poster.url})))

  $event.append($("<div>")
        .addClass("event-title")
        .text(e.title))

  $event.append($("<div>")
        .addClass("event-location")
        .text(getLocationDetails(e)))

  $event.append($("<div>")
        .addClass("event-attendance")
        .text(getAttendanceDetails(e)))

  return $event
}

function insertEventIndex(e, $location) {
  $.each(e, function(index, eventsList) {
    if(eventsList.length > 0) {
      $eventIndex = $("<div>").addClass("events-index")
        .append($("<div>")
                  .addClass("events-date")
                  .text((new Date(eventsList[0].start).toDateString())))

      $.each(eventsList, function(index, event) {
        $eventIndex.append(makeEvent(event))
      } )
      $location.append($eventIndex);
    }
  } )
}



$(document).ready(function() {
  $events = $("#events-index")
  console.log($events)

  if($events !== null) {
    var events_data = $('#events').data('events')
    events = splitEvents(events_data)
    console.log(makeEvent(events[1][0]))
    $events.empty();
    insertEventIndex(events, $events)
  }
})
