class MyTeam.Routers.MembersRouter extends Backbone.Router
  routes:
    "teams/:team_id/members/join"    : "join"
    "teams/:team_id/members/index"   : "index"
    "teams/:team_id/members/:id/edit": "edit"
    "teams/:team_id/members/:id"     : "show"
    "teams/:team_id/members"         : "index"

  initialize: (options) ->
    @app  = MyTeam
    @menu = MyTeam.Helpers.MenuHelper
    @page = $("#page")
    @on("all", @change)

  change: (route, team_id) ->
    @menu.toggle_team_menus(true, team_id)

  index: (team_id) ->
    @render new MyTeam.Views.Members.IndexView(members: @app.get_members(team_id))

  join: (team_id) ->
    @render new MyTeam.Views.Members.JoinView(model: MyTeam.get_team(team_id))    

  edit: (team_id, id) ->
    member = @app.get_members(team_id, false).detect (m) -> 
      m.get("user_id").toString() == id.toString()
    @render new MyTeam.Views.Members.EditView(model: member)

  show: (team_id, id) ->
    member = @app.get_members(team_id, false).detect (m) -> 
      m.get("user_id").toString() == id.toString()
    @render new MyTeam.Views.Members.ShowView(model: member)

  render: (view) ->
    @page.html(view.render().el)