///<reference path="../typings/all.d.ts"/>

class UrlHelper {
    getBrowserDomain() {
        console.log('yep, working!')
        return window.location.href.split('/')[2]
    }

    getBrowserUrlRaw() {
        return window.location.href.split('/').slice(3, -1)
    }

    getBrowserUrl() {
        return this.getBrowserUrlRaw().join('/')
    }

    isRedmineHomePage() {
        return this.isRedmine() && this.getBrowserUrl() == ''
    }

    isRedmineIssuesPage() {
        var url = this.getBrowserUrl()
        return this.isRedmine() && (url.includes('issues?') || url.endsWith('issues'))
    }

    isRedmine() {
        return this.getBrowserDomain() == 'redmine.renuo.ch'
    }
}

window.define('helpers/urlHelper', [], () => new UrlHelper())
