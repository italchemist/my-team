MyTeam.Views.Teams ||= {}

class MyTeam.Views.Teams.NewView extends Backbone.View
  template: JST["backbone/templates/teams/new"]

  events:
    "submit #new-team": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()
    @model.bind("change:errors", () => this.render())

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()
    
    @model.unset("errors")
    @collection.create(@model.toJSON(),
      success: (team) =>
        @model = team
        Backbone.history.navigate("/teams/#{team.id}", true);
      error: (team, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    @$el.html(@template(@model.toJSON() ))
    @$("form").backboneLink(@model)
    return this
