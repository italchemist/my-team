class MyTeam.Models.Member extends Backbone.Model
  paramRoot: 'member'

  initialize: ->
    @set("team_id", @collection.team_id) if @collection

  parse: (r) ->
    m = super r
    url = @url?() ? @url
    m.team_id = (/\/api\/teams\/(\d)/i.exec url)[1]
    m

  defaults:
    user_id: null
    email: null

class MyTeam.Collections.MembersCollection extends Backbone.Collection
  model: MyTeam.Models.Member
  url: -> '/api/teams/' + @team_id + '/members'
  initialize: (models, options) ->
    @team_id = options.team_id