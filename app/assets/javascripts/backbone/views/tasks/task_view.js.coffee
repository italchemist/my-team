MyTeam.Views.Tasks ||= {}

class MyTeam.Views.Tasks.TaskView extends Backbone.View
  template: JST["backbone/templates/tasks/task"]

  tagName: "tr"

  initialize: () ->
    @options.show_description_as = "column" unless @options.show_description_as?
  render: ->
    @$el.html(@template({
      model: @model.toJSON(),
      show_description_as: @options.show_description_as
    }))
    return this
