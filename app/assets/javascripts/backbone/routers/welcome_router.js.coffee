class MyTeam.Routers.WelcomeRouter extends Backbone.Router
  routes:
    "" : "index"
    "/": "index"

  initialize: () ->
    @view = MyTeam.Helpers.ViewHelper
    @menu = MyTeam.Helpers.MenuHelper
    @page = $("#page")
    @on("all", @change)

  change: (route) ->
    @menu.toggle_team_menus(false)

  index: ->
    @render new MyTeam.Views.Welcome.IndexView()

  render: (view) ->
    @page.html view.render().el
    @view.fix_thumbnails()