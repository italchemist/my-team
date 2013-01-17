MyTeam.Views.Welcome ||= {}

class MyTeam.Views.Welcome.IndexView extends Backbone.View
  template: JST["backbone/templates/welcome/index"]

  initialize: () ->
    @app       = MyTeam
    @teamsView = new MyTeam.Views.Teams.IndexView(teams: @app.get_popular_teams())

  render: =>
    @$el.html @template
    @$("#teams").html @teamsView.render().el
    return this