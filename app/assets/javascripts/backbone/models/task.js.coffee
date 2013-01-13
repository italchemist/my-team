class MyTeam.Models.Task extends Backbone.Model
  paramRoot: 'task'

  defaults:
    title: null
    description: null
    closed: null

class MyTeam.Collections.TasksCollection extends Backbone.Collection
  model: MyTeam.Models.Task
  url: -> '/api/teams/' + @team_id + '/tasks'
  initialize: (models, options) ->
  	@team_id = options.team_id
