class MyTeam.Routers.TeamsRouter extends Backbone.Router
  routes:
    "teams/index"   : "index"
    "teams/new"     : "create"
    "teams/:id/edit": "edit"
    "teams/:id"     : "show"
    "teams"         : "index"

  initialize: (options) ->
    @app  = MyTeam
    @menu = MyTeam.Helpers.MenuHelper
    @page = $("#page")
    @on("all", @change)

  change: (route, team_id) ->
    @menu.toggle_team_menus(team_id?, team_id)

  index: ->
    @render new MyTeam.Views.Teams.IndexView(teams: @app.get_teams())

  create: ->
    @render new MyTeam.Views.Teams.NewView(collection: @app.get_teams())

  edit: (id) ->
    team = @app.get_teams().get(id)
    @render new MyTeam.Views.Teams.EditView(model: team)

  show: (id) ->
    team = @app.get_teams().get(id)
    @render new MyTeam.Views.Teams.ShowView(model: team)

  render: (view) ->
    @page.html(view.render().el)