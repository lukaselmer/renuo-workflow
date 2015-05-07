///<reference path="../../typings/all.d.ts"/>
///<reference path="../../helpers/urlHelper.ts"/>
///<reference path="../../models/issue.ts"/>
///<reference path="issueInitializer.ts"/>

class EnhancedPrioritySorting {
    issues:Issue[];

    constructor() {
        this.issues = this.initIssues();

        //new IssueInitializer(this.issues);

    }

    initIssues() {
        return $(".issue td.cf_5.float").toArray().map(function (el) {
            var priority = $(el).text().toNumber();
            var id = $(el).parent('.issue').children('.id').text().toNumber();
            return new Issue(id, priority);
        });
    }
}
