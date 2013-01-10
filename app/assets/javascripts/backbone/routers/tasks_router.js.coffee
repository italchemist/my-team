class MyTeam.Routers.TasksRouter extends Backbone.Router
  initialize: (options) ->
    @tasks = {}
    @tasks[options.team_id] = new MyTeam.Collections.TasksCollection(null, {team_id:options.team_id})
    @tasks[options.team_id].reset options.tasks

  routes:
    "teams/:team_id/tasks/new"      : "create"
    "teams/:team_id/tasks/index"    : "index"
    "teams/:team_id/tasks/:id/edit" : "edit"
    "teams/:team_id/tasks/:id"      : "show"
    "teams/:team_id/tasks"          : "index"

  index: (team_id) ->
    @view = new MyTeam.Views.Tasks.IndexView({tasks: @collection(team_id), team_id: team_id})
    $("#page").html(@view.render().el)

  show: (team_id, id) ->
    task = @collection(team_id, false).get(id)
    @view = new MyTeam.Views.Tasks.ShowView(model: task)
    $("#page").html(@view.render().el)

  create: (team_id) ->
    @view = new MyTeam.Views.Tasks.NewView({collection: @collection(team_id), team_id: team_id})
    $("#page").html(@view.render().el)

  edit: (team_id, id) ->
    task = @collection(team_id, false).get(id)
    @view = new MyTeam.Views.Tasks.EditView({model: task, team_id: team_id})
    $("#page").html(@view.render().el)

  collection: (team_id, async = true) ->
    collection = @tasks[team_id]
    unless collection?
      collection = new MyTeam.Collections.TasksCollection(null, { team_id: team_id })
      @tasks[team_id] = collection
      collection.fetch({ async: async })
    return collection