MyTeam.Views.Users ||= {}

class MyTeam.Views.Users.SignUpView extends Backbone.View
  template: JST["backbone/templates/users/signup"]

  events:
    "submit #new-user": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()
    @model.unset("errors")
    
    $.post('/api/users', {user: @model.toJSON()}, (resp) ->
      MyTeam.Helpers.MenuHelper.toggle_user_authenicated(resp.id)
      if (resp.id)
        Backbone.history.navigate("/teams", true)
      else
        @model.set({errors: $.parseJSON(resp.responseText)})
    )
  
  render: ->
    @$el.html(@template(@model.toJSON() ))
    this.$("form").backboneLink(@model)
    return this