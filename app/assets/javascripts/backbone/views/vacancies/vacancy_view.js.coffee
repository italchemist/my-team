MyTeam.Views.Vacancies ||= {}

class MyTeam.Views.Vacancies.VacancyView extends Backbone.View
  template: JST["backbone/templates/vacancies/vacancy"]

  tagName: "tr"

  initialize: () ->
    @options.show_description_as = "column" unless @options.show_description_as?
    @options.show_skills_as = "column" unless @options.show_skills_as?

  render: ->
    @$el.html @template
      model: @model.toJSON()
      show_description_as: @options.show_description_as
      show_skills_as: @options.show_skills_as
    
    if @options.show_description_as == "popover"
      @$("a.lnk").popover
        title: @model.get("title")
        content: @model.get("description")
        trigger: "hover"
        placement: "top"
        delay: { show:500 }

    return this
