///<reference path="../../models/issue.ts"/>
///<reference path="../../typings/tsd/jasmine/jasmine.d.ts"/>
///<reference path="issueInitializer.ts"/>

describe("IssueInitializer", function () {
    it("can init the IssueInitializer", function () {
        expect(new IssueInitializer([])).not.toBe(null);
    });

    it("sets the NP if no NP is set (or NP==0)", function () {
        var issue1:Issue = new Issue(93588, 0);
        var issue2:Issue = new Issue(93589, 0);
        var issue3:Issue = new Issue(93520, 0);

        spyOn(issue1, 'sendUpdateToServer');
        spyOn(issue2, 'sendUpdateToServer');
        spyOn(issue3, 'sendUpdateToServer');

        var issueInitializer:IssueInitializer = new IssueInitializer([issue1, issue2, issue3]);

        expect(issue1.sendUpdateToServer).toHaveBeenCalled();
        expect(issue1.numericalPriority).toBeGreaterThan(0);
        expect(issue1.numericalPriority).toBeLessThan(1000);

        expect(issue2.sendUpdateToServer).toHaveBeenCalled();
        expect(issue2.numericalPriority).toBeGreaterThan(0);
        expect(issue2.numericalPriority).toBeLessThan(1000);

        expect(issue3.sendUpdateToServer).toHaveBeenCalled();
        expect(issue3.numericalPriority).toBeGreaterThan(0);
        expect(issue3.numericalPriority).toBeLessThan(1000);

        expect(issue1.numericalPriority).not.toBe(issue2.numericalPriority);
        expect(issue1.numericalPriority).not.toBe(issue3.numericalPriority);
        expect(issue2.numericalPriority).not.toBe(issue3.numericalPriority);
    });
});
