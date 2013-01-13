class MyTeam.Helpers.ViewHelper
  @fix_thumbnails: () ->
    $(".row-fluid .thumbnails").each ->
      $thumbnails = $(this).children()
      previousOffsetLeft = $thumbnails.first().offset().left
      $thumbnails.removeClass "first-in-row"
      $thumbnails.first().addClass "first-in-row"
      $thumbnails.each ->
        $thumbnail = $(this)
        offsetLeft = $thumbnail.offset().left
        $thumbnail.addClass "first-in-row"  if offsetLeft < previousOffsetLeft
        previousOffsetLeft = offsetLeft

