'use strict'

class RedmineGlobal
  constructor: (@urlHelper, @hotkeyManager) ->
    @initRedmineHotkeys()

  initRedmineHotkeys: ->
    # Global keys
    @hotkeyManager.registerHotkey('Go to home', 'h', @redirectTo('/'))

    # Project keys
    @hotkeyManager.registerHotkey('Go to project issues', 'i', @redirectTo('%project%/issues'))
    @hotkeyManager.registerHotkey('Go to project wiki', 'w', @redirectTo('%project%/wiki'))
    @hotkeyManager.registerHotkey('Go to project roadmap', 'r', @redirectTo('%project%/roadmap'))
    @hotkeyManager.registerHotkey('Go to project time entries', 't', @redirectTo('%project%/time_entries'))
    @hotkeyManager.registerHotkey('Go to project overview', 'o', @redirectTo('%project%'))
    @hotkeyManager.registerHotkey('Go to project activity', 'a', @redirectTo('%project%/activity'))
    @hotkeyManager.registerHotkey('Go to project activity', 's', @redirectTo('%project%/settings'))
    @hotkeyManager.registerHotkey('Create new issue', 'n', @redirectTo('%project%/issues/new'))

    # Issue keys
    @hotkeyManager.registerHotkey('Edit issue', 'e', @redirectTo('%issue%/edit'))

  redirectTo: (suffix) -> () =>
    if suffix.startsWith('%issue%')
      window.location = suffix.replace('%issue%', "/issues/#{@urlHelper.getBrowserUrlRaw()[1]}")
    else if suffix.startsWith('%project%')
      window.location = suffix.replace('%project%', "/projects/#{@urlHelper.getBrowserUrlRaw()[1].split('?')[0]}")
    else
      window.location = suffix


define 'redmine/global', ['helpers/urlHelper', 'helpers/hotkeyManager'], (urlHelper, hotkeyManager) ->
  new RedmineGlobal(urlHelper, hotkeyManager) if urlHelper.isRedmine()
