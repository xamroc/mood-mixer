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
          $("#music-list").append $("<p>" + item.href + "</p>")

      # $("#music-list").html("Done.")
      e.preventDefault()