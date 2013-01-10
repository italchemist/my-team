class MyTeam.Routers.WelcomeRouter extends Backbone.Router
  routes:
    ""  : "index"
    "/" : "index"

  index: ->
    @view = new MyTeam.Views.Welcome.IndexView()
    $("#page").html(@view.render().el)