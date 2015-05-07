///<reference path="../typings/all.d.ts"/>

class UrlHelper {
    currentUrl:string = null;

    getBrowserDomain():string {
        return this.getCurrentUrl().split('/')[2]
    }

    getBrowserUrlRaw():string[] {
        return this.getCurrentUrl().split('/').slice(3)
    }

    getBrowserUrl():string {
        return this.getBrowserUrlRaw().join('/')
    }

    isRedmineHomePage():boolean {
        return this.isRedmine() && this.getBrowserUrl() == ''
    }

    isRedmineIssuesPage() {
        var url = this.getBrowserUrl();
        return this.isRedmine() && (url.indexOf('issues?') != -1 || url.endsWith('issues'))
    }

    isRedmine() {
        return this.getBrowserDomain() == 'redmine.renuo.ch'
    }

    private getCurrentUrl():string {
        if (this.currentUrl) return this.currentUrl;
        return window.location.href;
    }
}
