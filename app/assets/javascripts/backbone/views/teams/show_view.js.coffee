MyTeam.Views.Teams ||= {}

class MyTeam.Views.Teams.ShowView extends Backbone.View
  template: JST["backbone/templates/teams/show"]

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
