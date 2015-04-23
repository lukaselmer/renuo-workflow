///<reference path="../typings/all.d.ts"/>
///<reference path="../helpers/urlHelper.ts"/>
///<reference path="../models/issue.ts"/>

class EnhancedPrioritySorting {
    issues:Issue[];

    constructor() {
        this.issues = this.initIssues();
        console.log(this.issues);
        //console.log("updating issue prio");
        //new Issue(3588, 20, 20).updateIssuePriority(777);
    }

    initIssues() {
        return $(".issue td.cf_5.float").toArray().map(function (index, el) {
            var priority = $(el).text().toNumber();
            var id = $(el).parent('.issue').children('.id').text().toNumber();
            return new Issue(id, priority, index);
        });
    }
}
