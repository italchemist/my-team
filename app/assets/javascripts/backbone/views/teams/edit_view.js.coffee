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
        @team_id = team.get("id")
        @model   = team
        Backbone.history.navigate("/teams/#{@team_id}", true);
    )

  render: ->
    @$el.html(@template(@model.toJSON() ))
    @$("form").backboneLink(@model)
    return this
