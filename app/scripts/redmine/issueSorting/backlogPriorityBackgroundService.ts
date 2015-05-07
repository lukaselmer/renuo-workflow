///<reference path="../../models/issue.ts"/>

class BacklogPriorityBackgroundService {
    constructor(public issues:Issue[]) {
        // TODO: order issues by prio
        /*issues.forEach(function (issue) {
         console.log(issue)
         if (issue.numericalPriority !== 0) return;

         //issue.updateIssuePriority(Math.random() * 1000);
         });*/
    }

    tick() {
        if (this.issues.length <= 0) return;

        var maxIssue:Issue = null;
        var maxMove:number = 0;
        var prevPriority:number = 0;

        this.issues.forEach((issue, index) => {
            var nextPriority = 1000;
            var nextIssueIndex = index + 1;
            if (nextIssueIndex < this.issues.length) nextPriority = this.issues[nextIssueIndex].numericalPriority;

            var possibleMove = this.issueMove(issue, prevPriority, nextPriority);
            prevPriority = issue.numericalPriority;

            if (Math.abs(possibleMove) > Math.abs(maxMove)) {
                maxIssue = issue;
                maxMove = possibleMove;
            }
        });

        if (maxMove > 0) maxIssue.updateIssuePriority(maxIssue.numericalPriority + maxMove);
    }

    private issueMove(issue:Issue, prevPriority, nextPriority) {
        var middle = (nextPriority + prevPriority) / 2.0;
        // TODO console.log("next " + nextPriority + ", prev " + prevPriority + ", move " + (middle - issue.numericalPriority) + ", new value " + middle);
        return middle - issue.numericalPriority;
    }
}
