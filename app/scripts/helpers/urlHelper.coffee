'use strict'

class UrlHelper
  constructor: ->
    this

  getBrowserDomain: ->
    window.location.href.split('/')[2]

  getBrowserUrlRaw: ->
    window.location.href.split('/')[3..-1]

  getBrowserUrl: ->
    @getBrowserUrlRaw().join('/')

  isRedmineHomePage: ->
    @isRedmine() and @getBrowserUrl() == ''

  isRedmineIssuesPage: ->
    url = @getBrowserUrl()
    @isRedmine() and (url.includes('issues?') or url.endsWith('issues'))

  isRedmine: ->
    @getBrowserDomain() == 'redmine.renuo.ch'

define 'helpers/urlHelper', [], -> new UrlHelper()
