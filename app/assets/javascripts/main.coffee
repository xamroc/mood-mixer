$ ->
  $(".mood").on "click", () ->
    alert $(@).attr("id")