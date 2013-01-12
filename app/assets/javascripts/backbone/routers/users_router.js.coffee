class MyTeam.Routers.UsersRouter extends Backbone.Router
  routes:
    "users/sign_up" : "sign_up"
    "users/sign_in" : "sign_in"

  initialize: () ->
    @users = new MyTeam.Collections.UsersCollection()
    @on("all", @change)

  change: ->
    MyTeam.Helpers.MenuHelper.toggle_team_menus(false)

  sign_up: ->
    @view = new MyTeam.Views.Users.SignUpView(collection: @users)
    $("#page").html(@view.render().el)

  sign_in: ->
    @view = new MyTeam.Views.Users.SignInView(collection: @users)
    $("#page").html(@view.render().el)