$ ->
  d3.select("#chart")
    .data([200,300,400,500,600])
    .transition()
    .duration(2000)
    .style "width", (d) ->
      d + "px"