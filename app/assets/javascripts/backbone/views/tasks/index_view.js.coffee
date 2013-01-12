MyTeam.Views.Tasks ||= {}

class MyTeam.Views.Tasks.IndexView extends Backbone.View
  template: JST["backbone/templates/tasks/index"]

  initialize: () ->
    @options.tasks.bind("reset", @addAll)

  addAll: () =>
    @options.tasks.each(@addOne)

  addOne: (task) =>
    view = new MyTeam.Views.Tasks.TaskView(model: task)
    @$("tbody").append(view.render().el)

  render: =>
    @$el.html(@template())
    @addAll()
    return this
