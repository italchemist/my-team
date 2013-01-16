MyTeam.Views.Members ||= {}

class MyTeam.Views.Members.MemberView extends Backbone.View
  template: JST["backbone/templates/members/member"]

  tagName: "tr"

  initialize: () ->
    @options.show_description_as = "column" unless @options.show_description_as?
    
  render: ->
    @$el.html(@template({
      model: @model.toJSON(),
      show_description_as: @options.show_description_as
    }))
    return this