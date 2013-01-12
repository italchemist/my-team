#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers
#= require_tree ./helpers

window.MyTeam =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  Helpers: {}
  initialize: (party_id, activities, parties) ->
    @team_id = $("#page").data("team-id")

    @tasks = {}
    @tasks[@team_id] = new MyTeam.Collections.TasksCollection(null, {team_id: @team_id})
    @tasks[@team_id].reset $("#page").data("tasks")

    teams   = $("#page").data("teams")
    tasks   = $("#page").data("tasks")

    new MyTeam.Routers.TasksRouter
    new MyTeam.Routers.WelcomeRouter()
    new MyTeam.Routers.UsersRouter()
    new MyTeam.Routers.TeamsRouter({collection: teams})
    
    
    Backbone.history.start(pushState: true)

  # returns task collection for specified team id
  get_tasks: (team_id, async = true) ->
    collection = @tasks[team_id]
    unless collection?
      collection      = new MyTeam.Collections.TasksCollection(null, { team_id: team_id })
      @tasks[team_id] = collection
      collection.fetch async: async
    collection

$(document).ready ->
  MyTeam.initialize()