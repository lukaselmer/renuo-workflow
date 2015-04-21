'use strict'

window.define 'redmine/home', ['helpers/urlHelper'], (urlHelper) ->
  addIssues = (leftInner) ->
    $('<h3>Issues</h3>').appendTo leftInner
    issuesList = $('<ul></ul>')
    addIssueLink = (name, url) ->
      link = $('<a></a>').text(name).attr('href', url)
      $('<li></li>').addClass('quicksearchable-home').append(link).appendTo issuesList
    addIssueLink('Issues', '/issues')
    addIssueLink('Backlog (to estimate)', '/issues?query_id=31')
    addIssueLink('Backlog (in progress)', '/issues?query_id=35')
    addIssueLink('Backlog (to assign)', '/issues?query_id=33')
    addIssueLink('Backlog (to agree)', '/issues?query_id=32')
    addIssueLink('My Tickets', '/issues?query_id=14')
    leftInner.append(issuesList)

  addProjects = (leftInner) ->
    $('<h3>All projects </h3>').appendTo leftInner
    list = $('<ul></ul>')
    $('#project_quick_jump_box option').each (_index, value) ->
      url = $(value).val()
      project = $(value).text()
      link = $('<a></a>').text(project).attr('href', url)
      $('<li></li>').addClass('quicksearchable-home').append(link).appendTo list if url and url != ''
    leftInner.append list

  initSearch = (leftInner) ->
    leftInner.append $('<input>').attr('id', 'quicksearch')
    $('#quicksearch').bind('keyup change input', (event) ->
      search = $('#quicksearch').val().toLowerCase()
      $('.quicksearchable-home').each (_id, value) ->
        if $(value).text().toLowerCase().indexOf(search) == -1
          $(value).hide()
        else
          $(value).show()
    ).bind 'keyup', (event) ->
      return unless event.keyCode == 13 # enter
      $('.quicksearchable-home:visible').children()[0].click()
    $('#quicksearch').focus()

  initRedmineHomePage = ->
    left = $('.splitcontentleft')
    leftInner = $('<div></div').addClass('projects box').appendTo(left)

    initSearch(leftInner)
    addIssues(leftInner)
    addProjects(leftInner)

  initRedmineHomePage() if urlHelper.isRedmineHomePage()
