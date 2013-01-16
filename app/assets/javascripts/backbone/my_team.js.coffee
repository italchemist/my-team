#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers
#= require_tree ./helpers

window.MyTeam =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  Helpers: {}
  initialize: (party_id, activities, parties) ->
    @team_id = $("#page").data("team-id")
    @task_id = $("#page").data("task-id")

    @tasks = {}
    @tasks[@team_id] = new MyTeam.Collections.TasksCollection(null, {team_id: @team_id})
    @tasks[@team_id].reset $("#page").data("tasks")

    @vacancies = {}
    @vacancies[@team_id] = new MyTeam.Collections.VacanciesCollection(null, {team_id: @team_id})
    @vacancies[@team_id].reset $("#page").data("tasks")

    @task_comments = {}
    @task_comments[@team_id] = {}
    @task_comments[@team_id][@task_id] = new MyTeam.Collections.CommentsCollection(null, { team_id: @team_id, task_id: @task_id })
    @task_comments[@team_id][@task_id].reset $("#page").data("comments")

    @teams = new MyTeam.Collections.TeamsCollection($("#page").data("teams"))

    new MyTeam.Routers.TeamsRouter
    new MyTeam.Routers.TasksRouter
    new MyTeam.Routers.WelcomeRouter
    new MyTeam.Routers.UsersRouter
    new MyTeam.Routers.VacanciesRouter
    
    Backbone.history.start(pushState: true)

  get_vacancies: (team_id, async = true) ->
    collection = @vacancies[team_id]
    unless collection?
      collection = new MyTeam.Collections.VacanciesCollection(null, { team_id: team_id })
      @vacancies[team_id] = collection
      collection.fetch async: async
    collection

  #
  get_task_comments: (team_id, task_id, async) ->
    collection = @task_comments[team_id]
    @task_comments[team_id] = {} unless collection?
    collection = @task_comments[team_id][task_id]
    unless collection?
      collection = new MyTeam.Collections.CommentsCollection(null, { team_id: team_id, task_id: task_id })
      @task_comments[team_id][task_id] = collection
      collection.fetch async: async
    collection

  # gets team instance
  get_team: (team_id) ->
    team = @teams.get(team_id)
    unless team?
      team = new MyTeam.Models.Team()
      team.url = "/api/teams/#{team_id}"
      team.fetch({async:false})
      get_teams().add(team)
    team

  # returns teams collection
  get_teams: () ->
    @teams

  # returns task collection for specified team id
  get_tasks: (team_id, async = true) ->
    collection = @tasks[team_id]
    unless collection?
      collection      = new MyTeam.Collections.TasksCollection(null, { team_id: team_id })
      @tasks[team_id] = collection
      collection.fetch async: async
    collection

$(document).ready ->
  MyTeam.initialize()