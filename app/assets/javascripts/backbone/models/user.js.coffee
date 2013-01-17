class MyTeam.Models.User extends Backbone.Model
  paramRoot: 'user'

  defaults:
    email: null
    password: null
    name: null

class MyTeam.Collections.UsersCollection extends Backbone.Collection
  model: MyTeam.Models.User
  url: '/api/users'