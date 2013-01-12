class MyTeam.Models.User extends Backbone.Model
  paramRoot: 'user'

  defaults:
    email: null
    password: null

  #methodToURL:
  #  "create": "/api/users.json"
  #  "read":   "/api/users"
  #  "update": "/api/users/update"
  #  "delete": "/api/users/remove"
  #
  #sync: (method, model, options) ->
  #  @options = options || {}
  #  @options.url = model.methodToURL[method.toLowerCase()]
  #  Backbone.sync(method, model, options)

class MyTeam.Collections.UsersCollection extends Backbone.Collection
  model: MyTeam.Models.User
  url: '/api/users'