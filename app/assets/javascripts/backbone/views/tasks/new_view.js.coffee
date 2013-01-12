MyTeam.Views.Tasks ||= {}

class MyTeam.Views.Tasks.NewView extends Backbone.View
  template: JST["backbone/templates/tasks/new"]

  events:
    "submit #new-task": "save"

  constructor: (options) ->
    super(options)
    @team_id = @collection.team_id
    @model   = new @collection.model()
    @model.set("team_id", @team_id)
    @model.bind("change:errors", () => this.render())

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")
    @collection.create(@model.toJSON(),
      success: (task) =>
        @model = task
        Backbone.history.navigate("/teams/#{@team_id}/tasks", true);
      error: (task, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    @$el.html(@template(@model.toJSON()))
    @$("form").backboneLink(@model)
    return this
