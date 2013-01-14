class MyTeam.Models.Comment extends Backbone.Model
  paramRoot: 'comment'

  defaults:
    comment: null

class MyTeam.Collections.CommentsCollection extends Backbone.Collection
  model: MyTeam.Models.Comment