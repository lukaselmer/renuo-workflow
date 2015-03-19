'use strict'

define 'redmine/home', ['helpers/urlHelper'], (urlHelper) ->
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

  initRedmineHomePage() if urlHelper.isRedmineHomePage()
