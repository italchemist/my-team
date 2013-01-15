MyTeam.Views.Teams ||= {}

class MyTeam.Views.Teams.ShowView extends Backbone.View
  template: JST["backbone/templates/teams/show"]

  render: ->
    app       = MyTeam
    team_id   = @model.get("id")
    tasks     = app.get_tasks(team_id)
    vacancies = app.get_vacancies(team_id)
    task_view = new MyTeam.Views.Tasks.IndexView({tasks: tasks, show_header: false, show_description_as: "popover"})
    vacancies_view = new MyTeam.Views.Vacancies.IndexView({vacancies: vacancies, show_header: false, show_description_as: "popover", show_skills_as: "none"})
    
    @$el.html(@template({team:@model.toJSON()}))
    @$("#tasks").append(task_view.render().el)
    @$("#vacancies").append(vacancies_view.render().el)

    return this
