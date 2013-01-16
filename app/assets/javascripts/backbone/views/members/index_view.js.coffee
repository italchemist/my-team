MyTeam.Views.Members ||= {}

class MyTeam.Views.Members.IndexView extends Backbone.View
  template: JST["backbone/templates/members/index"]

  initialize: () ->
    @options.members.bind("reset", @addAll)
    @options.show_header = true unless @options.show_header?
    @options.show_description_as = "column" unless @options.show_description_as?

  addAll: () =>
    @options.members.each(@addOne)

  addOne: (member) =>
    view = new MyTeam.Views.Members.MemberView({
      model: member,
      show_description_as: @options.show_description_as
    })
    @$("tbody").append(view.render().el)
    if @options.show_description_as == "popover"
      @$("a.lnk").popover
        title:member.get("title")
        content:member.get("description")
        trigger:"hover"
        placement:"top"
        delay: {show:500}

  render: =>
    @$el.html(@template({
      show_header: @options.show_header,
      show_description_as: @options.show_description_as
    }))
    @addAll()
    return this