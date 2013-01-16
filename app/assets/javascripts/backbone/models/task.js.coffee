class MyTeam.Models.Task extends Backbone.Model
  paramRoot: 'task'

  initialize: ->
    @set("team_id", @collection.team_id) if @collection

  parse: (r) ->
    m = super r
    url = @url?() ? @url
    m.team_id = (/\/api\/teams\/(\d)/i.exec url)[1]
    m

  defaults:
    title: null
    description: null
    closed: null
    team_id: null

class MyTeam.Collections.TasksCollection extends Backbone.Collection
  model: MyTeam.Models.Task
  url: -> '/api/teams/' + @team_id + '/tasks'
  initialize: (models, options) ->
    @team_id = options.team_id