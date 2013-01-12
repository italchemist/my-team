MyTeam.Views.Tasks ||= {}

class MyTeam.Views.Tasks.EditView extends Backbone.View
  template: JST["backbone/templates/tasks/edit"]

  events:
    "submit #edit-task": "update"

  update: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @team_id = @model.get("team_id")
    @model.save(null,
      success: (task) =>
        @model = task
        Backbone.history.navigate("/teams/#{@team_id}/tasks", true);
    )

  render: ->
    @$el.html(@template(@model.toJSON()))
    @$("form").backboneLink(@model)
    return this
