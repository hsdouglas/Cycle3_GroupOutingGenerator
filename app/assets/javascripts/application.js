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
//= require jquery.slick
//= require_tree .


function showPaymentModal() {
  document.getElementById("payment-modal").showModal();
}

function hidePaymentModal() {
	document.getElementById("payment-modal").close();
}

function splitEvents(events, attendance) {
  var returnArray = [ [] ]
  var currentDate = new Date(events[0].start)
  var returnArrayIndex = 0;
  $.each(events, function(index, value) {
    value.attendance = attendance[index]
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
  details += (new Date(e.start)).toLocaleTimeString()
  details += " at "
  details += e.venue_title
  return details
}

function getAttendanceDetails(e) {
  if(e.attendance === 1) {
    return "There is currently 1 person attending"
  }
  else {
    return "There are currently " + e.attendance + " people attending"
  }
}

function makeEvent(e) {
  var eventURL = "/events/" + e.id
  $event = $("<a>").addClass("event")
                   .attr({href:eventURL})
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


  var a = "<div class='cta-container'><button class='cta-button'>More information</button></div>"
  $event.append($(a))

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


function DaySwitcher(events, $eventsContainer) {
  this.events = events
  this.$eventsContainer = $eventsContainer
  this.currentDay = 0

  self = this

  this.nextDayExists = function() {
    if(self.events.length > self.currentDay + 1) {
      return true
    }
    return false
  }

  this.previousDayExists = function() {
    if(0 <= self.currentDay - 1) {
      return true
    }
    return false
  }

  this.nextDay = function() {
    if(self.nextDayExists()) {
      self.currentDay += 1
      self.renderDay()
      return true
    }
    return false
  }

  this.previousDay = function() {
    if(self.previousDayExists()) {
      self.currentDay -= 1
      self.renderDay()
      return true
    }
    return false
  }

  this.eventsHeader = function() {
    var $eventsHeader = $("<div>").addClass("events-header")
    $eventsHeader.append($("<a href='#'><</a>")
                           .addClass("events-previous")
                           .click(self.previousDay)
                        )

    $eventsHeader.append($("<div>")
                           .addClass("events-date")
                           .text(new Date(self.events[self.currentDay][0].start).toDateString())
                         )

    $eventsHeader.append($("<a href='#'>></a>")
                           .addClass("events-next")
                           .click(self.nextDay)
                        )
    return $eventsHeader
  }

  this.eventsList = function() {
    var $eventsList = $("<div>").addClass("events-list")
    $.each(self.events[self.currentDay], function(index, event) {
      $eventsList.append(makeEvent(event))
    } )
    window.setTimeout(function() {
      $(".events-list").slick({infinite: false})
    }, 0)
    return $eventsList
  }

  this.renderDay = function() {
    $eventsContainer.empty()
    $eventsContainer.append(self.eventsHeader())
    $eventsContainer.append(self.eventsList())
  }

  this.renderDay()
}




function loadEventsIndex() {
  var $events = $("#events-index")
  var events_data = $('#events').data('events')
  var events_attendance = $('#events').data('eventsattendance')

  console.log(events_attendance)
  if(events_data != undefined) {
    events = splitEvents(events_data, events_attendance)
    $events.empty();
    var switcher = new DaySwitcher(events, $events)
  }
}
