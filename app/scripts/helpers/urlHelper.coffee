'use strict'

define 'helpers/urlHelper', [], ->
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

    isRedmine: ->
      @getBrowserDomain() == 'redmine.renuo.ch'

  new UrlHelper()
