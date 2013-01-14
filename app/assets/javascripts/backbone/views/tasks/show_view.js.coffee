MyTeam.Views.Tasks ||= {}

class MyTeam.Views.Tasks.ShowView extends Backbone.View
  template: JST["backbone/templates/tasks/show"]

  render: ->
    task_id = @model.get("id")
    team_id = @model.get("team_id")
    items   = MyTeam.get_task_comments(team_id, task_id)
    view    = new MyTeam.Views.Comments.IndexView(comments: items)

    @$el.html(@template(@model.toJSON()))
    @$("#comments").html(view.render().el)

    return this