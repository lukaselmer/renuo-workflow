///<reference path="../../models/issue.ts"/>

class IssueDropper {
    constructor(public issues:Issue[]) {
    }

    dropIssueBetween(toDrop:Issue, below:Issue, above:Issue) {
        if (below == null) below = new Issue(-1, 0);
        if (above == null) above = new Issue(-1, 1000);
        toDrop.updateIssuePriority((below.numericalPriority + above.numericalPriority) / 2);
    }
}
