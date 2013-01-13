MyTeam.Views.Teams ||= {}

class MyTeam.Views.Teams.ShowView extends Backbone.View
  template: JST["backbone/templates/teams/show"]

  render: ->
    app     = MyTeam
    team_id = @model.get("id")
    tasks   = app.get_tasks(team_id)
    view    = new MyTeam.Views.Tasks.IndexView({tasks: tasks, show_header: false, show_description_as: "popover"})
    
    @$el.html(@template({team:@model.toJSON()}))
    @$("#tasks").append(view.render().el)

    return this
