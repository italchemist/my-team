MyTeam.Views.Teams ||= {}

class MyTeam.Views.Teams.EditView extends Backbone.View
  template: JST["backbone/templates/teams/edit"]

  events:
    "submit #edit-team": "update"

  update: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success: (team) =>
        @model = team
        Backbone.history.navigate("/teams", true);
    )

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
