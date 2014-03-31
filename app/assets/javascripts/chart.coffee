$ ->
  $.ajax
    type: "POST"
    url: "stats"
    success: (data, textStatus, jqXHR) ->
      no_zeroes = true
      for key, value of data
        if value == 0
          no_zeroes = false
          break

      if no_zeroes
        w = 380
        h = 380
        r = 190
        color = d3.scale.category10()

        data = [{"label":"Motivational", "value":data.motivational},
                {"label":"Happy", "value":data.happy},
                {"label":"Sad", "value":data.sad},
                {"label":"Angry", "value":data.angry}]

        vis = d3.select("#chart")
          .append("svg:svg")
          .data([data])
            .attr("width", w)
            .attr("height", h)
          .append("svg:g")
            .attr("transform", "translate(" + r + "," + r + ")")

        arc = d3.svg.arc()
          .outerRadius r

        pie = d3.layout.pie()
          .value (d) -> d.value

        arcs = vis.selectAll("g.slice")
          .data(pie)
          .enter()
            .append("svg:g")
              .attr("class", "slice")

        arcs.append("svg:path")
          .attr "fill", (d, i) ->
            color(i)
          .attr "d", arc

        arcs.append("svg:text")
          .attr "transform", (d) ->
            d.innerRadius = 0
            d.outerRadius = r
            "translate(" + arc.centroid(d) + ")"
          .attr("text-anchor", "middle")
          .attr("fill", "hsla(0, 0%, 90%, 1)")
          .text (d, i) -> data[i].label
      else
        $("#chart").html("<img src='/images/nsa-data.jpg'>")