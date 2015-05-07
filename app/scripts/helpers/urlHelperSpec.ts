///<reference path="../typings/all.d.ts"/>
///<reference path="urlHelper.ts"/>

describe("UrlHelper", function () {
    it("can init the url helper", function () {
        expect(new UrlHelper()).not.toBe(null);
    });

    it("gets the browser domain", function () {
        var urlHelper = new UrlHelper();
        urlHelper.currentUrl = 'https://redmine.company.com/';
        expect(urlHelper.getBrowserDomain()).toEqual('redmine.company.com');
        urlHelper.currentUrl = 'https://redmine.company.com/issues';
        expect(urlHelper.getBrowserDomain()).toEqual('redmine.company.com');
        urlHelper.currentUrl = 'https://redmine.company.com/projects/bla/issues';
        expect(urlHelper.getBrowserDomain()).toEqual('redmine.company.com');
    });

    it("gets the browser url", function () {
        var urlHelper = new UrlHelper();
        urlHelper.currentUrl = 'https://redmine.company.com/';
        expect(urlHelper.getBrowserUrl()).toEqual('');
        urlHelper.currentUrl = 'https://redmine.company.com/issues';
        expect(urlHelper.getBrowserUrl()).toEqual('issues');
        urlHelper.currentUrl = 'https://redmine.company.com/projects/bla/issues';
        expect(urlHelper.getBrowserUrl()).toEqual('projects/bla/issues');
    });

    it("gets the browser url raw", function () {
        var urlHelper = new UrlHelper();
        urlHelper.currentUrl = 'https://redmine.company.com/';
        expect(urlHelper.getBrowserUrlRaw()).toEqual(['']);
        urlHelper.currentUrl = 'https://redmine.company.com/issues';
        expect(urlHelper.getBrowserUrlRaw()).toEqual(['issues']);
        urlHelper.currentUrl = 'https://redmine.company.com/projects/bla/issues';
        expect(urlHelper.getBrowserUrlRaw()).toEqual(['projects', 'bla', 'issues']);
    });

    it("finds the redmine url", function () {
        var urlHelper = new UrlHelper();
        urlHelper.currentUrl = 'https://redmine.renuo.ch/';
        expect(urlHelper.isRedmine()).toBe(true);
        urlHelper.currentUrl = 'https://redmine.company.com/';
        expect(urlHelper.isRedmine()).toBe(false);
    });

    it("finds the redmine home page", function () {
        var urlHelper = new UrlHelper();
        urlHelper.currentUrl = 'https://redmine.renuo.ch/';
        expect(urlHelper.isRedmineHomePage()).toBe(true);
        urlHelper.currentUrl = 'https://redmine.renuo.ch/projects';
        expect(urlHelper.isRedmineHomePage()).toBe(false);

        urlHelper.currentUrl = 'https://redmine.company.com/';
        expect(urlHelper.isRedmineHomePage()).toBe(false);
    });

    it("finds the redmine issues page", function () {
        var urlHelper = new UrlHelper();
        urlHelper.currentUrl = 'https://redmine.renuo.ch/issues';
        expect(urlHelper.isRedmineIssuesPage()).toBe(true);
        urlHelper.currentUrl = 'https://redmine.renuo.ch/projects/bla/issues';
        expect(urlHelper.isRedmineIssuesPage()).toBe(true);
        urlHelper.currentUrl = 'https://redmine.renuo.ch/issues?query_id=35';
        expect(urlHelper.isRedmineIssuesPage()).toBe(true);
        urlHelper.currentUrl = 'https://redmine.renuo.ch/';
        expect(urlHelper.isRedmineIssuesPage()).toBe(false);
        urlHelper.currentUrl = 'https://redmine.renuo.ch/issues/43443';
        expect(urlHelper.isRedmineIssuesPage()).toBe(false);

        urlHelper.currentUrl = 'https://redmine.company.ch/issues';
        expect(urlHelper.isRedmineIssuesPage()).toBe(false);
    });
});
