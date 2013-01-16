MyTeam.Views.Members ||= {}

class MyTeam.Views.Members.JoinView extends Backbone.View
  template: JST["backbone/templates/members/join"]

  events:
    "click #join": "join"

  initialize: () ->
    @model = MyTeam.get_current_team()

  join: (e) =>
    e.preventDefault()
    e.stopPropagation()
    team_id = @model.get("id")
    @model.unset("errors")

    $.ajax "/api/teams/#{team_id}/members/join",
      contentType: "application/json"
      dataType: "json"
      type: "POST"
      data: {}
      success: (response) ->
        MyTeam.Helpers.MenuHelper.toggle_user_authenicated(response.id)
        MyTeam.Helpers.NoticeHelper.success("Команда", "Вы успешно вступили в команду!")
        Backbone.history.navigate("/teams/#{team_id}", true)
      error: (response) ->
        @model.set(errors: $.parseJSON(response.responseText))

  render: =>
    @$el.html(@template(team: @model.toJSON()))
    return this