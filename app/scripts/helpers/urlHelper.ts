///<reference path="../typings/all.d.ts"/>

class UrlHelper {
    getBrowserDomain() {
        return window.location.href.split('/')[2]
    }

    getBrowserUrlRaw() {
        return window.location.href.split('/').slice(3)
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
