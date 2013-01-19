class MyTeam.Models.Vacancy extends Backbone.Model
  paramRoot: 'vacancy'

  initialize: ->
    @set("team_id", @collection.team_id) if @collection

  parse: (r) ->
    m = super r
    url = @url?() ? @url
    m.team_id = (/\/api\/teams\/(\d*)/i.exec url)[1]
    m

  defaults:
    title: null
    description: null
    skills: null

class MyTeam.Collections.VacanciesCollection extends Backbone.Collection
  model: MyTeam.Models.Vacancy
  url: -> '/api/teams/' + @team_id + '/vacancies'
  initialize: (models, options) ->
    @team_id = options.team_id