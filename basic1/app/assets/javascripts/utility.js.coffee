$(document).on "ready page:load", ->
  $expandedArea = $("#article_no_expiration")
  change_expired_at = ->
    $target = $("#article_expired_at")
    if $expandedArea.prop("checked")
      $target.hide()
    else
      $target.show()
  $expandedArea.bind("click", change_expired_at)
  change_expired_at()