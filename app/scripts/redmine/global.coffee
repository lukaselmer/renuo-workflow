'use strict'

define 'redmine/global', ['helpers/urlHelper'], (urlHelper) ->
  initRedmineGlobal = ->
    redirectTo = (suffix) ->
      () ->
        if suffix.indexOf('%issue%') == 0
          window.location = suffix.replace('%issue%', "/issues/#{urlHelper.getBrowserUrlRaw()[1]}")
        else if suffix.indexOf('%project%') == 0
          window.location = suffix.replace('%project%', projectUrl = "/projects/#{urlHelper.getBrowserUrlRaw()[1].split('?')[0]}")
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

  initRedmineGlobal() if urlHelper.isRedmine()
