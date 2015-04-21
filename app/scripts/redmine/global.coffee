'use strict'

class RedmineGlobal
  constructor: (@urlHelper, @hotkeyManager) ->
    @initRedmineHotkeys()

  initRedmineHotkeys: ->
    # Global keys
    @hotkeyManager.registerHotkey('Go to home', 'g h', @redirectTo('/'))

    # Project keys
    @hotkeyManager.registerHotkey('Go to project issues', 'g i', @redirectTo('%project%/issues'))
    @hotkeyManager.registerHotkey('Go to project wiki', 'g w', @redirectTo('%project%/wiki'))
    @hotkeyManager.registerHotkey('Go to project roadmap', 'g r', @redirectTo('%project%/roadmap'))
    @hotkeyManager.registerHotkey('Go to project time entries', 'g t', @redirectTo('%project%/time_entries'))
    @hotkeyManager.registerHotkey('Go to project overview', 'g o', @redirectTo('%project%'))
    @hotkeyManager.registerHotkey('Go to project activity', 'g a', @redirectTo('%project%/activity'))
    @hotkeyManager.registerHotkey('Go to project settings', 'g s', @redirectTo('%project%/settings'))
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


window.define 'redmine/global', ['helpers/urlHelper', 'helpers/hotkeyManager'], (urlHelper, hotkeyManager) ->
  new RedmineGlobal(urlHelper, hotkeyManager) if urlHelper.isRedmine()
