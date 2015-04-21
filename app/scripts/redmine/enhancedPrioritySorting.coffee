'use strict'

window.define 'redmine/enhancedPrioritySorting', ['helpers/urlHelper'], (urlHelper) ->
  initInteractiveIssuesSorting = ->
    numericPriority = $('.issue td.cf_5.float')
    # TODO: implement this
    #console.log numericPriority
    #numericPriority.size()
    #console.log numericPriority.size()

  initInteractiveIssuesSorting() if urlHelper.isRedmineIssuesPage()
