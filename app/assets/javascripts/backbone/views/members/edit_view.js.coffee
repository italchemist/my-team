MyTeam.Views.Members ||= {}

class MyTeam.Views.Members.EditView extends Backbone.View
  template: JST["backbone/templates/members/edit"]

  events:
    "submit #edit-task": "update"
    "click #save"      : "update"
    "click .destroy"   : "destroy"

  destroy: (e) ->
    e.preventDefault()
    e.stopPropagation()

    team_id = @model.get("team_id")
    @model.destroy()
    
    $.ajax "/api/teams/#{team_id}/members/dismiss",
      contentType: "application/json"
      dataType: "json"
      type: "POST"
      data: JSON.stringify(user_id: @model.get("user_id"))
      success: (response) ->
        MyTeam.Helpers.NoticeHelper.success("Команда", "Вы исключили участника из команды!")
        Backbone.history.navigate("/teams/#{team_id}/members", true)
      error: (response) ->
        @model.set(errors: $.parseJSON(response.responseText))

  update: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.set("closed", @$("#closed").is(":checked"))

    @team_id = @model.get("team_id")
    @model.save(null,
      success: (task) =>
        @model = task
        Backbone.history.navigate("/teams/#{@team_id}/tasks", true)
        MyTeam.Helpers.NoticeHelper.success("Задача", "Задача сохранена")
    )

  render: ->
    @$el.html(@template(@model.toJSON()))
    @$("form").backboneLink(@model)
    return this
