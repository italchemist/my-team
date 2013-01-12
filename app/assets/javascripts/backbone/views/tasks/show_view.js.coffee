MyTeam.Views.Tasks ||= {}

class MyTeam.Views.Tasks.ShowView extends Backbone.View
  template: JST["backbone/templates/tasks/show"]

  render: ->
    @$el.html(@template(@model.toJSON()))
    return this
