class MyTeam.Routers.TasksRouter extends Backbone.Router
  routes:
    "teams/:team_id/tasks/new"      : "create"
    "teams/:team_id/tasks/index"    : "index"
    "teams/:team_id/tasks/:id/edit" : "edit"
    "teams/:team_id/tasks/:id"      : "show"
    "teams/:team_id/tasks"          : "index"

  initialize: (options) ->
    @on("all", @change)

  change: (route, team_id) ->
    MyTeam.Helpers.MenuHelper.toggle_team_menus(true, team_id)

  index: (team_id) ->
    @view = new MyTeam.Views.Tasks.IndexView({tasks: MyTeam.get_tasks(team_id), team_id: team_id})
    $("#page").html(@view.render().el)

  show: (team_id, id) ->
    task = MyTeam.get_tasks(team_id, false).get(id)
    @view = new MyTeam.Views.Tasks.ShowView(model: task)
    $("#page").html(@view.render().el)

  create: (team_id) ->
    @view = new MyTeam.Views.Tasks.NewView({collection: MyTeam.get_tasks(team_id), team_id: team_id})
    $("#page").html(@view.render().el)

  edit: (team_id, id) ->
    task = MyTeam.get_tasks(team_id, false).get(id)
    @view = new MyTeam.Views.Tasks.EditView({model: task, team_id: team_id})
    $("#page").html(@view.render().el)