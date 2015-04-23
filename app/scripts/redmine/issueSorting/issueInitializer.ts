///<reference path="../../models/issue.ts"/>

class IssueInitializer {
    constructor(public issues:Issue[]) {
        console.log(issues)
        issues.forEach(function (issue) {
            console.log(issue)
            if (issue.numericalPriority !== 0) return;
            issue.updateIssuePriority(Math.random() * 1000);
        });
    }
}
