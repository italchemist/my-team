MyTeam.Views.Tasks ||= {}

class MyTeam.Views.Tasks.IndexView extends Backbone.View
  template: JST["backbone/templates/tasks/index"]

  initialize: () ->
    @options.tasks.bind("reset", @addAll)
    @options.show_header = true unless @options.show_header?
    @options.show_description_as = "column" unless @options.show_description_as?

  addAll: () =>
    @options.tasks.each(@addOne)

  addOne: (task) =>
    view = new MyTeam.Views.Tasks.TaskView({
      model: task,
      show_description_as: @options.show_description_as
    })
    @$("tbody").append(view.render().el)
    if @options.show_description_as == "popover"
      @$("a.lnk").popover
        title:task.get("title")
        content:task.get("description")
        trigger:"hover"
        placement:"top"
        delay: {show:500}

  render: =>
    @$el.html(@template({
      show_header: @options.show_header,
      show_description_as: @options.show_description_as
    }))
    @addAll()
    return this