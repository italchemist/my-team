class MyTeam.Models.Vacancy extends Backbone.Model
  paramRoot: 'vacancy'

  defaults:
    title: null
    description: null
    skills: null

class MyTeam.Collections.VacanciesCollection extends Backbone.Collection
  model: MyTeam.Models.Vacancy
  url: -> '/api/teams/' + @team_id + '/vacancies'
  initialize: (models, options) ->
    @team_id = options.team_id