class MyTeam.Routers.UsersRouter extends Backbone.Router
  routes:
    "users/sign_up": "sign_up"
    "users/sign_in": "sign_in"

  initialize: ->
    @menu  = MyTeam.Helpers.MenuHelper
    @users = new MyTeam.Collections.UsersCollection()
    @page  = $("#page")
    @on("all", @change)

  change: ->
    @menu.toggle_team_menus(false)

  sign_up: ->
    @render new MyTeam.Views.Users.SignUpView(collection: @users)

  sign_in: ->
    @render new MyTeam.Views.Users.SignInView(collection: @users)

  render: (view) ->
    @page.html(view.render().el)