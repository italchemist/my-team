class MyTeam.Models.Team extends Backbone.Model
  paramRoot: 'team'

  defaults:
    name: null
    description: null

class MyTeam.Collections.TeamsCollection extends Backbone.Collection
  model: MyTeam.Models.Team
  url: '/api/teams'
