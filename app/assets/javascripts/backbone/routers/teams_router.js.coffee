class MyTeam.Routers.TeamsRouter extends Backbone.Router
  routes:
    "teams/new"      : "create"
    "teams/index"    : "index"
    "teams/:id/edit" : "edit"
    "teams/:id"      : "show"
    "teams"          : "index"

  initialize: (options) ->
    @teams = new MyTeam.Collections.TeamsCollection()
    @teams.reset options.collection
    @on("all", @change)

  change: (route, team_id) ->
    MyTeam.Helpers.MenuHelper.toggle_team_menus(team_id?, team_id)

  index: ->
    @view = new MyTeam.Views.Teams.IndexView(teams: @teams)
    $("#page").html(@view.render().el)

  show: (id) ->
    team = @teams.get(id)
    @view = new MyTeam.Views.Teams.ShowView(model: team)
    $("#page").html(@view.render().el)

  create: ->
    @view = new MyTeam.Views.Teams.NewView(collection: @teams)
    $("#page").html(@view.render().el)

  edit: (id) ->
    team = @teams.get(id)
    @view = new MyTeam.Views.Teams.EditView(model: team)
    $("#page").html(@view.render().el)