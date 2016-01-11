$ ->
  names = $('#run_graph_canvas').data('names')
  distances = $('#run_graph_canvas').data('distances')
  data = {
    labels: names,
    datasets: [
      {
        fillColor: "rgba(151,187,205,0.5)",
        strokeColor: "rgba(151,187,205,0.8)",
        highlightFill: "rgba(151,187,205,0.75)",
        highlightStroke: "rgba(151,187,205,1)",
        data: distances
      }
    ]
  }

  myNewChart = new Chart($("#run_graph_canvas").get(0).getContext("2d")).Bar(data, {
    responsive: true
    scaleShowGridLines: false
    barValueSpacing: 2
    scaleFontFamily: "'Montserrat', 'Helvetica', 'Arial', sans-serif"
    tooltipFontFamily: "'Montserrat', 'Helvetica', 'Arial', sans-serif"
    tooltipTitleFontFamily: "'Montserrat', 'Helvetica', 'Arial', sans-serif"
    tooltipTemplate: "<%if (label){%><%=label%>: <%}%><%= value %> miles"
  })
