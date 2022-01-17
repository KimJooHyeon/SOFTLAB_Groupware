/**
 * App Calendar
 */

/**
 * ! If both start and end dates are same Full calendar will nullify the end date value.
 * ! Full calendar will end the event on a day before at 12:00:00AM thus, event won't extend to the end date.
 * ! We are getting events from a separate file named app-calendar-events.js. You can add or remove events from there.
 **/

'use-strict';

// RTL Support
var direction = 'ltr',
	assetPath = '../../../app-assets/';
if ($('html').data('textdirection') == 'rtl') {
  direction = 'rtl';
}

if ($('body').attr('data-framework') === 'laravel') {
  assetPath = $('body').attr('data-asset-path');
}

$(document).on('click', '.fc-sidebarToggle-button', function (e) {
  $('.app-calendar-sidebar, .body-content-overlay').addClass('show');
});

$(document).on('click', '.body-content-overlay', function (e) {
  $('.app-calendar-sidebar, .body-content-overlay').removeClass('show');
});

document.addEventListener('DOMContentLoaded', function () {
  var calendarEl = document.getElementById('calendar'),
    eventToUpdate,
    sidebar = $('.event-sidebar'),
    calendarsColor = {
      Business: 'primary',
      Holiday: 'success',
      Personal: 'danger',
      Family: 'warning',
      ETC: 'info'
    },
    eventForm = $('.event-form'),
    addEventBtn = $('.add-event-btn'),
    cancelBtn = $('.btn-cancel'),
    updateEventBtn = $('.update-event-btn'),
    toggleSidebarBtn = $('.btn-toggle-sidebar'),
    eventTitle = $('#title'),
    eventLabel = $('#select-label'),
    startDate = $('#start-date'),
    endDate = $('#end-date'),
    eventUrl = $('#event-url'),
    eventGuests = $('#event-guests'),
    eventLocation = $('#event-location'),
    allDaySwitch = $('.allDay-switch'),
    selectAll = $('.select-all'),
    calEventFilter = $('.calendar-events-filter'),
    filterInput = $('.input-filter'),
    btnDeleteEvent = $('.btn-delete-event'),
    calendarEditor = $('#event-description-editor'),
	count = $('#countHidden');

  // --------------------------------------------
  // On add new item, clear sidebar-right field fields
  // --------------------------------------------
  $('.add-event button').on('click', function (e) {
    $('.event-sidebar').addClass('show');
    $('.sidebar-left').removeClass('show');
    $('.app-calendar .body-content-overlay').addClass('show');
  });

  // Label  select
  if (eventLabel.length) {
    function renderBullets(option) {
      if (!option.id) {
        return option.text;
      }
      var $bullet =
        "<span class='bullet bullet-" +
        $(option.element).data('label') +
        " bullet-sm mr-50'> " +
        '</span>' +
        option.text;

      return $bullet;
    }
    eventLabel.wrap('<div class="position-relative"></div>').select2({
      placeholder: 'Select value',
      dropdownParent: eventLabel.parent(),
      templateResult: renderBullets,
      templateSelection: renderBullets,
      minimumResultsForSearch: -1,
      escapeMarkup: function (es) {
        return es;
      }
    });
  }

  // Guests select
  if (eventGuests.length) {
    function renderGuestAvatar(option) {
      if (!option.id) {
        return option.text;
      }

      var $avatar =
        "<div class='d-flex flex-wrap align-items-center'>" +
        "<div class='avatar avatar-sm my-0 mr-50'>" +
        "<span class='avatar-content'>" +
        "<img src='" +
        assetPath +
        'images/avatars/' +
        $(option.element).data('avatar') +
        "' alt='avatar' />" +
        '</span>' +
        '</div>' +
        option.text +
        '</div>';

      return $avatar;
    }
    eventGuests.wrap('<div class="position-relative"></div>').select2({
      placeholder: 'Select value',
      dropdownParent: eventGuests.parent(),
      closeOnSelect: false,
      templateResult: renderGuestAvatar,
      templateSelection: renderGuestAvatar,
      escapeMarkup: function (es) {
        return es;
      }
    });
  }

  // Start date picker
  if (startDate.length) {
    var start = startDate.flatpickr({
      enableTime: true,
      altFormat: 'Y-m-dTH:i:S',
	  minDate:'today',
      onReady: function (selectedDates, dateStr, instance) {
        if (instance.isMobile) {
          $(instance.mobileInput).attr('step', null);
        }
      },
	  onChange:function(selectDates, dateStr, instance){
		end.set("minDate",dateStr);
	}
    });
  }
  
	var end;	
  // End date picker
  if (endDate.length) {
      end = endDate.flatpickr({
      enableTime: true,
      altFormat: 'Y-m-dTH:i:S',
	  mindate:'today',
      onReady: function (selectedDates, dateStr, instance) {
        if (instance.isMobile) {
          $(instance.mobileInput).attr('step', null);
        }
      }
    });
  }

  function getFormatDate(date){
	var year = date.getFullYear();
    var month = (1 + date.getMonth());
    month = month >= 10 ? month : '0' + month;
    var day = date.getDate();
    day = day >= 10 ? day : '0' + day;
    return year + '-' + month + '-' + day;
  }
  // Event click function
  function eventClick(info) {
    eventToUpdate = info.event;
	var id = eventToUpdate._def.publicId;
	
    if (eventToUpdate.url) {
      info.jsEvent.preventDefault();
      window.open(eventToUpdate.url, '_blank');
    }

    sidebar.modal('show');
    addEventBtn.addClass('d-none');
    cancelBtn.addClass('d-none');
    updateEventBtn.removeClass('d-none');
    btnDeleteEvent.removeClass('d-none');
	
	var dateStart = info.event._instance.range.start;
	var dateEnd = info.event._instance.range.end
	
	calendarEditor.val(info.event._def.extendedProps.schdulCn)
//	eventLabel.val(info.event._def.extendedProps.mtgrUnit).prop("selected", true);
//	console.log(info.event._def.extendedProps.mtgrUnit);	//S1, S2, S3
	eventLabel.val(info.event._def.extendedProps.mtgrUnit).trigger('change');
	startDate.val(getFormatDate(dateStart));
	endDate.val(getFormatDate(dateEnd));
	count.val(id);
	
    eventTitle.val(eventToUpdate.title);
    start.setDate(eventToUpdate.start, true, 'Y-m-d');
    eventToUpdate.end !== null
      ? end.setDate(eventToUpdate.end, true, 'Y-m-d')
      : end.setDate(eventToUpdate.start, true, 'Y-m-d');

	}
    //  Delete Event
	btnDeleteEvent.on('click', function () {
//		eventToUpdate.remove();
		var eventData = {
	        id: count.val(),
			calendar: eventLabel.val(),
	      }
		console.log(eventData.id, eventData.calendar);
		$.ajax({
			url: '/mtgr/calendarDeleteAjax',
	        type: 'POST',
			data:JSON.stringify(eventData),
//			dataType:'json',
			contentType : "application/json; charset=utf-8",
	        success: function (result) {
				console.log("checkDelete",result.length);
				if(result.length > 0){
					sidebar.modal('hide');
					calendar.refetchEvents();
				}else{
					$(".delete").modal();
					return false;
				}
	        },
	        error: function (error) {
	          console.log(error);
	        }
		})
		// removeEvent(eventToUpdate.id);
		sidebar.modal('hide');
		$('.event-sidebar').removeClass('show');
		$('.app-calendar .body-content-overlay').removeClass('show');
	});

  // Modify sidebar toggler
  function modifyToggler() {
    $('.fc-sidebarToggle-button')
      .empty()
      .append(feather.icons['menu'].toSvg({ class: 'ficon' }));
  }

  // Selected Checkboxes
  function selectedCalendars() {
    var selected = [];
    $('.calendar-events-filter input:checked').each(function () {
      selected.push($(this).attr('data-value'));
    });
    return selected;
  }

// --------------------------------------------------------------------------------------------------
  // AXIOS: fetchEvents
  // * This will be called by fullCalendar to fetch events. Also this can be used to refetch events.
  // --------------------------------------------------------------------------------------------------

  function fetchEvents(info, successCallback) {
    // Fetch Events from API endpoint reference
//	console.log(selectAll);
//	console.log(lists);
//	console.log("되나ㅏㅏ");
	//메인 캘린더 채우기!!!!!!!
    $.ajax(
      {
        url: '/mtgr/reservationCalendarMainAjax',
        type: 'GET',
//		data:{checkList:lists, selectAll:selectAll},
		dataType:'json',
        success: function (result) {
          // Get requested calendars as Array
			console.log("check",result);
			console.log("success함")
			//이 부분이 캘린더에 실제로 출력해주는 부분
			
		  	successCallback(result);
			
          //var calendars = selectedCalendars();

        },
        error: function (error) {
          console.log(error);
        }
      }
    ); 
	
	 
	/*
    var calendars = selectedCalendars();
    // We are reading event object from app-calendar-events.js file directly by including that file above app-calendar file.
    // You should make an API call, look into above commented API call for reference
    selectedEvents = events.filter(function (event) {
      // console.log(event.extendedProps.calendar.toLowerCase());
      return calendars.includes(event.extendedProps.calendar.toLowerCase());
    });
    // if (selectedEvents.length > 0) {
    successCallback(selectedEvents);
    // }
	*/
  }


  // Calendar plugins
  var calendar = new FullCalendar.Calendar(calendarEl, {
    initialView: 'dayGridMonth',
	contentHeight: 680,
    events: fetchEvents,
    editable: false,
    dragScroll: true,
    dayMaxEvents: 2,
    eventResizableFromStart: true,
    customButtons: {
      sidebarToggle: {
        text: 'Sidebar'
      }
    },
    headerToolbar: {
      start: 'sidebarToggle, prev,next, title',
      end: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
    },
    direction: direction,
    initialDate: new Date(),
    navLinks: true, // can click day/week names to navigate views
    eventClassNames: function ({ event: calendarEvent }) {
      const colorName = calendarsColor[calendarEvent._def.extendedProps.calendar];

      return [
        // Background Color
        'bg-light-' + colorName
      ];
    },
    dateClick: function (info) {
      var date = moment(info.date).format('YYYY-MM-DD');
      resetValues();
      sidebar.modal('show');
      addEventBtn.removeClass('d-none');
      updateEventBtn.addClass('d-none');
      btnDeleteEvent.addClass('d-none');
      startDate.val(date);
      endDate.val(date);
    },
    eventClick: function (info) {
      eventClick(info);
    },
    datesSet: function () {
      modifyToggler();
    },
    viewDidMount: function () {
      modifyToggler();
    }
  });

  // Render calendar
  calendar.render();
  // Modify sidebar toggler
  modifyToggler();
  // updateEventClass();

  // Validate add new and update form
  if (eventForm.length) {
    eventForm.validate({
      submitHandler: function (form, event) {
        event.preventDefault();
        if (eventForm.valid()) {
          sidebar.modal('hide');
        }
      },
      title: {
        required: true
      },
      rules: {
        startDate: { required: true },
        endDate: { required: true }
      },
      messages: {
        startDate: { required: '필수입력사항입니다.' },
        endDate: { required: '필수입력사항입니다.' }
      }

    });
  }

  // Sidebar Toggle Btn
  if (toggleSidebarBtn.length) {
    toggleSidebarBtn.on('click', function () {
      cancelBtn.removeClass('d-none');
    });
  }

  // ------------------------------------------------
  // addEvent
  // ------------------------------------------------
  function addEvent(eventData) {
    calendar.addEvent(eventData);
    calendar.refetchEvents();
  }

  // ------------------------------------------------
  // updateEvent
  // ------------------------------------------------
  function updateEvent(eventData) {
    var propsToUpdate = ['id', 'title', 'url'];
    var extendedPropsToUpdate = ['calendar', 'guests', 'location', 'description'];

    updateEventInCalendar(eventData, propsToUpdate, extendedPropsToUpdate);
  }

  // ------------------------------------------------
  // removeEvent
  // ------------------------------------------------
  function removeEvent(eventId) {
    removeEventInCalendar(eventId);
  }

  // ------------------------------------------------
  // (UI) updateEventInCalendar
  // ------------------------------------------------
  const updateEventInCalendar = (updatedEventData, propsToUpdate, extendedPropsToUpdate) => {
    const existingEvent = calendar.getEventById(updatedEventData.id);

    // --- Set event properties except date related ----- //
    // ? Docs: https://fullcalendar.io/docs/Event-setProp
    // dateRelatedProps => ['start', 'end', 'allDay']
    // eslint-disable-next-line no-plusplus
//    for (var index = 0; index < propsToUpdate.length; index++) {
//      var propName = propsToUpdate[index];
//      existingEvent.setProp(propName, updatedEventData[propName]);
//    }

    // --- Set date related props ----- //
    // ? Docs: https://fullcalendar.io/docs/Event-setDates
//    existingEvent.setDates(updatedEventData.start, updatedEventData.end, { allDay: updatedEventData.allDay });

    // --- Set event's extendedProps ----- //
    // ? Docs: https://fullcalendar.io/docs/Event-setExtendedProp
    // eslint-disable-next-line no-plusplus
//    for (var index = 0; index < extendedPropsToUpdate.length; index++) {
//      var propName = extendedPropsToUpdate[index];
//      existingEvent.setExtendedProp(propName, updatedEventData.extendedProps[propName]);
//    }
  };

  // ------------------------------------------------
  // (UI) removeEventInCalendar
  // ------------------------------------------------
  function removeEventInCalendar(eventId) {
    calendar.getEventById(eventId).remove();
  }
  
  // Add new event
  $(addEventBtn).on('click', function () {
    if (eventForm.valid()) {
      var newEvent = {
        id: calendar.getEvents().length + 10,
		title: eventTitle.val(),
        start: startDate.val(),
        end: endDate.val(),
        startStr: startDate.val(),
        endStr: endDate.val(),
        display: 'block',
		calendar: eventLabel.val(),
		description: calendarEditor.val()
      }
	  console.log(newEvent.title);
	  $.ajax({
		url:"/mtgr/calendarAddAjax",
		type:"POST",
		data: JSON.stringify(newEvent),
		contentType : "application/json; charset=utf-8",
		dataType:"json",
		success : function(data) {
		    console.log("data",data.length);
			if(data.length > 0){
				sidebar.modal('hide');
				calendar.refetchEvents();
			}else{
				$(".insert").modal();
				return false;
			}
		}, // success 
	    error : function(xhr, status) {
		       alert(xhr + " : " + status);
		}
	  });
    };
  });

  // Update new event
  updateEventBtn.on('click', function () {
	console.log(count.val());
    if (eventForm.valid()) {
		var eventData = {
			id: count.val(),
	        title: eventTitle.val(),
	        start: startDate.val(),
	        end: endDate.val(),
			calendar: eventLabel.val(),
			description: calendarEditor.val(),
		};
		$.ajax({
		url:"/mtgr/calendarUpdateAjax",
		type:"POST",
		data: JSON.stringify(eventData),
		contentType : "application/json; charset=utf-8",
		dataType:"json",
		success : function(data) {
			console.log("data : ",data.length);
			if(data.length > 0){
				sidebar.modal('hide');
				calendar.refetchEvents();
			}else{
				$(".update").modal();
				return false;
			}
		}, // success 
	    error : function(xhr, status) {
		       alert(xhr + " : " + status);
		}
	  });
      updateEvent(eventData);
      sidebar.modal('hide');
    }
  });

  // Reset sidebar input values
  function resetValues() {
    endDate.val('');
    eventUrl.val('');
    startDate.val('');
    eventTitle.val('');
    eventLocation.val('');
    allDaySwitch.prop('checked', false);
    eventGuests.val('').trigger('change');
    calendarEditor.val('');
  }

  // When modal hides reset input values
  sidebar.on('hidden.bs.modal', function () {
    resetValues();
  });

  // Hide left sidebar if the right sidebar is open
  $('.btn-toggle-sidebar').on('click', function () {
    btnDeleteEvent.addClass('d-none');
    updateEventBtn.addClass('d-none');
    addEventBtn.removeClass('d-none');
    $('.app-calendar-sidebar, .body-content-overlay').removeClass('show');
  });

  // Select all & filter functionality
  if (selectAll.length) {
    selectAll.on('change', function () {
      var $this = $(this);

      if ($this.prop('checked')) {
        calEventFilter.find('input').prop('checked', true);
      } else {
        calEventFilter.find('input').prop('checked', false);
      }
      calendar.refetchEvents();
    });
  }

  if (filterInput.length) {
    filterInput.on('change', function () {
      $('.input-filter:checked').length < calEventFilter.find('input').length
        ? selectAll.prop('checked', false)
        : selectAll.prop('checked', true);
		console.log("select");
      calendar.refetchEvents();
    });
  }
});
