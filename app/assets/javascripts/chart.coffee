$ ->
    w = 400
    h = 400
    r = 200
    color = d3.scale.category10()

    data = [{"label":"Motivational", "value":5},
            {"label":"Happy", "value":2},
            {"label":"Sad", "value":3},
            {"label":"Angry", "value":4}]

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
      .text (d, i) ->
        data[i].label