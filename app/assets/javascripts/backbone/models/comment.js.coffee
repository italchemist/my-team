class MyTeam.Models.Comment extends Backbone.Model
  paramRoot: 'comment'

  defaults:
    comment: null

class MyTeam.Collections.CommentsCollection extends Backbone.Collection
  model: MyTeam.Models.Comment
  url: -> '/api/teams/' + @team_id + '/tasks/' + @task_id + '/comments'
  initialize: (models, options) ->
  	@team_id = options.team_id
  	@task_id = options.task_id
