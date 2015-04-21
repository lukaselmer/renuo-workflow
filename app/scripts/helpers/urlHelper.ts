///<reference path="../typings/all.d.ts"/>


class UrlHelper {
  getBrowserDomain() {
    return window.location.href.split('/')[2]
  }

  getBrowserUrlRaw() {
    console.log(window.location.href.split('/'))
    // TOOD: implement this
    //return window.location.href.split('/')[3.. - 1]
    return window.location.href.split('/')
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
