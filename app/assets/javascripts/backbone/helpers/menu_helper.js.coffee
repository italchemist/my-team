class MyTeam.Helpers.MenuHelper
  @toggle_team_menus: (show, team_id) ->
    if team_id
      team = MyTeam.get_team(team_id)
      $("#menu-main-index").html("Главная страница " + team.get("name"))
      $("#menu-main-button-title").html(team.get("name"))
    else
      $("#menu-main-button-title").html("Команды")

    $("#menu-main-index").toggle(show)
    $("#menu-main-edit").toggle(show)
    $("#menu-main-index").attr("href", "/teams/#{team_id}")
    $("#menu-main-edit").attr("href", "/teams/#{team_id}/edit")
    $("#menu-main-index-separator").toggle(show)
    
    # Tasks menu for team
    $("#menu-tasks").toggle(show)
    $("#menu-tasks-list").attr("href", "/teams/#{team_id}/tasks")
    $("#menu-tasks-new").attr("href", "/teams/#{team_id}/tasks/new")

    # Tasks menu for team
    $("#menu-vacancies").toggle(show)
    $("#menu-vacancies-list").attr("href", "/teams/#{team_id}/vacancies")
    $("#menu-vacancies-new").attr("href", "/teams/#{team_id}/vacancies/new")

    # Tasks menu for members
    $("#menu-members").toggle(show)
    $("#menu-members-list").attr("href", "/teams/#{team_id}/members")

  @toggle_user_authenicated: (value) ->
    $("#menu-users-signin").toggle(!value)
    $("#menu-users-signup").toggle(!value)
    $("#menu-users-account").toggle(value)
    $("#menu-users-signout").toggle(value)