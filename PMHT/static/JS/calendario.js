// Contenido de calendario.js

document.addEventListener("DOMContentLoaded", function () {
    console.log("DOMContentLoaded ejecutado");
    $.ajax({
      url: "{% url 'eventos_calendario' %}",
      type: "GET",
      success: function (data) {
        $("#psicologo-calendar").fullCalendar({
          header: {
            left: "prev,next today",
            center: "title",
            right: "month,agendaWeek,agendaDay",
          },
          defaultDate: moment(),
          editable: false,
          eventLimit: true,
          displayEventTime: false,
          events: data,
          locale: 'es',  // Configuración del idioma español
          dayClick: function (date, jsEvent, view) {
            console.log("dayClick ejecutado");
            var selectedDate = moment(date).format('YYYY-MM-DD');
            document.getElementById('fecha').value = selectedDate;
  
            // Redirigir a la página de agendar encuentro
            window.location.href = "{% url 'agendar_encuentro' %}";
          },
          eventRender: function (event, element) {
            element.css("background-color", event.color);
          },
          validRange: {
            start: moment(),
            end: moment().add(2, "months"),
          },
        });
      },
      error: function (error) {
        console.log("Error al cargar eventos:", error);
      },
    });
  });
  