'use strict'

$ ->
  init = ->
    initRedmineHomePage() if isRedmineHomePage()
    initRedmineGlobal() if isRedmine()

  getBrowserDomain = ->
    window.location.href.split('/')[2]

  getBrowserUrlRaw = ->
    window.location.href.split('/')[3..-1]

  getBrowserUrl = ->
    getBrowserUrlRaw().join('/')

  isRedmineHomePage = ->
    isRedmine() and getBrowserUrl() == ''

  isRedmine = ->
    getBrowserDomain() == 'redmine.renuo.ch'

  initRedmineHomePage = ->
    left = $('.splitcontentleft')
    leftInner = $('<div></div').addClass('projects box').appendTo(left)
    $('<h3>All projects </h3>').append($('<input>').attr('id', 'quicksearch')).appendTo leftInner
    list = $('<ul></ul>')
    $('#project_quick_jump_box option').each (_index, value) ->
      url = $(value).val()
      project = $(value).text()
      link = $('<a></a>').text(project).attr('href', url)
      $('<li></li>').addClass('project-filterable').append(link).appendTo list if url and url != ''
    leftInner.append list
    $('#quicksearch').bind 'keyup change input', ->
      search = $('#quicksearch').val().toLowerCase()
      $('.project-filterable').each (_id, value) ->
        if $(value).text().toLowerCase().indexOf(search) == -1
          $(value).hide()
        else
          $(value).show()
    $('#quicksearch').focus()

  initRedmineGlobal = ->
    redirectTo = (suffix) ->
      () ->
        if suffix.indexOf('%issue%') == 0
          window.location = suffix.replace('%issue%', "/issues/#{getBrowserUrlRaw()[1]}")
        else if suffix.indexOf('%project%') == 0
          window.location = suffix.replace('%project%', projectUrl = "/projects/#{getBrowserUrlRaw()[1].split('?')[0]}")
        else
          window.location = suffix

    # more info for the keyCombination: https://github.com/madrobby/keymaster
    initHotkey = (name, keyCombination, func) ->
      console.log keyCombination + ' = ' + name

      key(keyCombination, func)

    initRedmineHotkeys = ->
      # Global keys
      initHotkey('Go to home', 'h', redirectTo('/'))

      # Project keys
      initHotkey('Go to project issues', 'i', redirectTo('%project%/issues'))
      initHotkey('Go to project wiki', 'w', redirectTo('%project%/wiki'))
      initHotkey('Go to project roadmap', 'r', redirectTo('%project%/roadmap'))
      initHotkey('Go to project time entries', 't', redirectTo('%project%/time_entries'))
      initHotkey('Go to project overview', 'o', redirectTo('%project%'))
      initHotkey('Go to project activity', 'a', redirectTo('%project%/activity'))
      initHotkey('Go to project activity', 's', redirectTo('%project%/settings'))
      initHotkey('Create new issue', 'n', redirectTo('%project%/issues/new'))

      # Issue keys
      initHotkey('Edit issue', 'e', redirectTo('%issue%/edit'))

    initRedmineHotkeys()

  init()
