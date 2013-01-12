MyTeam.Views.Teams ||= {}

class MyTeam.Views.Teams.ShowView extends Backbone.View
  template: JST["backbone/templates/teams/show"]

  render: ->
    team_id = @model.get("id")
    tasks   = MyTeam.get_tasks(team_id)
    view    = new MyTeam.Views.Tasks.IndexView({tasks: tasks, team_id: team_id})
    
    @$el.html(@template({team:@model.toJSON()}))
    @$("#tasks").append(view.render().el)
    #@$el.append(view.render().el)

    return this
