MyTeam.Views.Users ||= {}

class MyTeam.Views.Users.SignInView extends Backbone.View
  template: JST["backbone/templates/users/signin"]

  events:
    "submit #new-session": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()
    @model.bind("change:errors", () => this.render())

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()
    @model.unset("errors")
    
    $.ajax "/api/users/sign_in",
      contentType: "application/json"
      dataType: "json"
      type: "POST"
      data: JSON.stringify(user: @model.toJSON())
      success: (response) ->
        if response.success
          user = response.user
          MyTeam.set_current_user(new MyTeam.Models.User(user))
          MyTeam.Helpers.MenuHelper.toggle_user_authenicated(true)
          MyTeam.Helpers.NoticeHelper.success("Авторизация", "Добро пожаловать, #{user.name}!")
          Backbone.history.navigate("/teams", true)
      error: (response) ->
        @model.set(errors: $.parseJSON(response.responseText))

  render: ->
    @$el.html(@template(@model.toJSON() ))
    this.$("form").backboneLink(@model)
    return this