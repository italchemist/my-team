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
    team_id = $("#page").data("team-id")
    teams   = $("#page").data("teams")
    tasks   = $("#page").data("tasks")

    new MyTeam.Routers.WelcomeRouter()
    new MyTeam.Routers.TeamsRouter({collection: teams})
    new MyTeam.Routers.TasksRouter({team_id: team_id, tasks: tasks})
    
    Backbone.history.start(pushState: true)

$(document).ready ->
  MyTeam.initialize()