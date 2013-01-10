#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.MyTeam =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  initialize: (party_id, activities, parties) ->
    teams = $("#page").data("teams")

    new MyTeam.Routers.WelcomeRouter()
    new MyTeam.Routers.TeamsRouter({collection: teams})
    Backbone.history.start(pushState: true)

$(document).ready ->
  MyTeam.initialize()