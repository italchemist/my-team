MyTeam.Views.Users ||= {}

class MyTeam.Views.Users.SignUpView extends Backbone.View
  template: JST["backbone/templates/users/signup"]

  events:
    "submit #new-user": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()
    @model.bind("change:errors", () => this.render())

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()
    @model.unset("errors")
    
    $.ajax "/api/users",
      contentType: "application/json"
      dataType: "json"
      type: "POST"
      data: JSON.stringify(user: @model.toJSON())
      success: (response) ->
        MyTeam.Helpers.MenuHelper.toggle_user_authenicated(response.id)
        MyTeam.Helpers.NoticeHelper.success("Регистрация", "Добро пожаловать, регистрация прошла успешно!")
        Backbone.history.navigate("/teams", true)
      error: (response) ->
        @model.set(errors: $.parseJSON(response.responseText))
  
  render: ->
    @$el.html(@template(@model.toJSON() ))
    this.$("form").backboneLink(@model)
    return this