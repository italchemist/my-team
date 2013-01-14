MyTeam.Views.Comments ||= {}

class MyTeam.Views.Comments.IndexView extends Backbone.View
  template: JST["backbone/templates/comments/index"]

  initialize: () ->
    @options.comments.bind("reset", @addAll)
    @options.comments.bind("add", @addOne)

  addAll: () =>
    @options.comments.each(@addOne)

  addOne: (comment) =>
    view = new MyTeam.Views.Comments.CommentView(model: comment)
    @$("#comments-list").append(view.render().el)

  render: =>
    @$el.html(@template())
    @addAll()

    view = new MyTeam.Views.Comments.NewView(collection: @options.comments)
    @$el.append(view.render().el)

    return this