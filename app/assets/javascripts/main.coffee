$ ->
  $(".mood").on "click", (e) ->
    # alert "hi"
    data = { mood: $(@).attr("id") }
    $.ajax
      type: "POST"
      url: "list"
      data: data
      success: (data, textStatus, jqXHR) ->
        $("#music-list").html("")
        for item in data
          $("#music-list").append $("<li id='music-item' value='" + item.href + "'>" + item.href + "</li>")

      # $("#music-list").html("Done.")
      e.preventDefault()

  $("#music-list").on "click", "#music-item", (e) ->
    src = $(@).attr("value")
    $("#music-player").html("")
    $("#music-player").append $("<iframe width='560' height='315' src='" + src + "' frameborder='0'></iframe>")
    e.preventDefault