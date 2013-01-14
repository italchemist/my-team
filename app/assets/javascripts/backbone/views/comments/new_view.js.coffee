MyTeam.Views.Comments ||= {}

class MyTeam.Views.Comments.NewView extends Backbone.View
  template: JST["backbone/templates/comments/new"]

  events:
    "submit #new-comment": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()
    @model.bind("change:errors", () => this.render())

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")
    @collection.create(@model.toJSON(),
      success: (task) =>
        @model = task
        MyTeam.Helpers.NoticeHelper.success("Комментарий", "создан")
        @$("#comment").val(null)
      error: (task, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    @$el.html(@template(@model.toJSON()))
    @$("form").backboneLink(@model)
    return this