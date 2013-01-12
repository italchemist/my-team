class MyTeam.Routers.TasksRouter extends Backbone.Router
  routes:
    "teams/:team_id/tasks/index"   : "index"
    "teams/:team_id/tasks/new"     : "create"
    "teams/:team_id/tasks/:id/edit": "edit"
    "teams/:team_id/tasks/:id"     : "show"
    "teams/:team_id/tasks"         : "index"

  initialize: (options) ->
    @app  = MyTeam
    @menu = MyTeam.Helpers.MenuHelper
    @page = $("#page")
    @on("all", @change)

  change: (route, team_id) ->
    @menu.toggle_team_menus(true, team_id)

  index: (team_id) ->
    @render new MyTeam.Views.Tasks.IndexView(tasks: @app.get_tasks(team_id))

  create: (team_id) ->
    @render new MyTeam.Views.Tasks.NewView(collection: @app.get_tasks(team_id))

  edit: (team_id, id) ->
    task = @app.get_tasks(team_id, false).get(id)
    @render new MyTeam.Views.Tasks.EditView(model: task)

  show: (team_id, id) ->
    task = @app.get_tasks(team_id, false).get(id)
    @render new MyTeam.Views.Tasks.ShowView(model: task)

  render: (view) ->
    @page.html(view.render().el)