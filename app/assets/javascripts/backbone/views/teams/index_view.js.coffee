MyTeam.Views.Teams ||= {}

class MyTeam.Views.Teams.IndexView extends Backbone.View
  template: JST["backbone/templates/teams/index"]

  initialize: () ->
    @options.teams.bind('reset', @addAll)

  addAll: () =>
    @options.teams.each(@addOne)

  addOne: (team) =>
    view = new MyTeam.Views.Teams.TeamView({model : team})
    @$("#teams-list").append(view.render().el)

  render: =>
    @$el.html(@template(teams: @options.teams.toJSON() ))
    @addAll()

    return this
