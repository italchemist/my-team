class MyTeam.Helpers.NoticeHelper
  @success: (title, text) ->
    @notice(title, text, "success")

  @notice: (title, text, type = 'info') ->
    $.pnotify
      title: title
      text: text
      nonblock: true
      nonblock_opacity: .2
      type: type