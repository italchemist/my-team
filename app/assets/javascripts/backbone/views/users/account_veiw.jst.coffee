MyTeam.Views.Users ||= {}

class MyTeam.Views.Users.AccountView extends Backbone.View
  template: JST["backbone/templates/users/account"]

  events:
    "submit #edit-user": "save"

  constructor: (options) ->
    super(options)
    @model = MyTeam.get_current_user()

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()
    @model.unset("errors")

    $.ajax "/api/users/update_account",
      contentType: "application/json"
      dataType: "json"
      type: "POST"
      data: JSON.stringify(@get_account_data())
      success: (response) ->
        MyTeam.Helpers.NoticeHelper.success("Аккаунт", "Данные обновлены")
      error: (response) ->
        @model.set(errors: $.parseJSON(response.responseText))

  get_account_data: ->
    { id: @model.id, name: $("#name").val(), password: $("#new-password").val() }

  render: ->
    @$el.html(@template(@model.toJSON()))
    this.$("form").backboneLink(@model)
    return this