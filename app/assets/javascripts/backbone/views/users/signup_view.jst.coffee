MyTeam.Views.Users ||= {}

class MyTeam.Views.Users.SignUpView extends Backbone.View
  template: JST["backbone/templates/users/signup"]

  events:
    "submit #new-user": "signup"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()
    @model.bind("change:errors", @errors)

  signup: (e) ->
    e.preventDefault()
    e.stopPropagation()
    @model.unset("errors")
    
    @loading true

    $.ajax "/api/users",
      contentType: "application/json"
      dataType: "json"
      type: "POST"
      data: JSON.stringify(user: @model.toJSON())
      success: (response) =>
        @loading false
        if response.success
          user = response.user
          MyTeam.set_current_user(new MyTeam.Models.User(user))
          MyTeam.Helpers.MenuHelper.toggle_user_authenicated(true)
          MyTeam.Helpers.NoticeHelper.success("Регистрация", "Добро пожаловать, регистрация прошла успешно!")
          Backbone.history.navigate("/teams", true)
      error: (response) =>
        @loading false
        @model.set(errors: $.parseJSON(response.responseText))
  
  loading: (status) ->
    if status
      @$("#signup").button("loading")
    else
      @$("#signup").button("reset")

  errors: (model, errors) =>
    @$("#signup-failed").show()
    $(".control-group").removeClass("error")
    $("#name-msg").html(null)
    $("#email-msg").html(null)
    $("#password-msg").html(null)
    for error, message of errors
      $("#"+error+"-grp").addClass("error")
      $("#"+error+"-msg").html(message)

  render: ->
    @$el.html(@template(@model.toJSON() ))
    this.$("form").backboneLink(@model)
    return this