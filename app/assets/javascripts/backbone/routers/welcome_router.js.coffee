class MyTeam.Routers.WelcomeRouter extends Backbone.Router
  routes:
    ""  : "index"
    "/" : "index"

  initialize: () ->
    @on("all", @change)

  change: (route) ->
    MyTeam.Helpers.MenuHelper.toggle_team_menus(false)

  index: ->
    @view = new MyTeam.Views.Welcome.IndexView()
    $("#page").html(@view.render().el)