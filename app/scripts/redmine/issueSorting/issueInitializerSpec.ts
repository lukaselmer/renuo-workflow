///<reference path="../../models/issue.ts"/>
///<reference path="../../typings/tsd/jasmine/jasmine.d.ts"/>
///<reference path="issueInitializer.ts"/>

describe("IssueInitializer", function () {
    it("can init the IssueInitializer", function () {
        expect(new IssueInitializer([])).not.toBe(null);
    });

    it("sets the correct BP when ticking", function () {
        var issue1:Issue = new Issue(1, 0);
        var issue2:Issue = new Issue(2, 1);
        var issue3:Issue = new Issue(3, 10);
        var issue4:Issue = new Issue(4, 101);
        var issue5:Issue = new Issue(5, 310);

        var issues = [issue1, issue2, issue3, issue4, issue5];

        var spies:jasmine.Spy[] = issues.map(issue => spyOn(issue, 'sendUpdateToServer'));

        var resetSpies = () => {
            spies.forEach(spy => spy.calls.reset())
        };

        function expectNoCall(except = null) {
            if (except) expect(except.sendUpdateToServer).toHaveBeenCalled();
            issues.forEach(function (issue:Issue) {
                if (issue !== except) expect(issue.sendUpdateToServer).not.toHaveBeenCalled();
            });
            resetSpies();
        }

        var issueInitializer:IssueInitializer = new IssueInitializer(issues);

        function expectToChangeOnTick(issueNumber:number, newPriority:number) {
            issueInitializer.tick();
            var issue = issues[issueNumber - 1];
            expectNoCall(issue);
            expect(issue.numericalPriority).toBeCloseTo(newPriority, 0.01);
        }

        expectNoCall();
        expectToChangeOnTick(5, 550.5);
        expectToChangeOnTick(4, 280.25);
        expectToChangeOnTick(3, 140.625);
        expectToChangeOnTick(5, 640.125);
        expectToChangeOnTick(4, 390.375);
        expectToChangeOnTick(2, 70.3125);
        expectToChangeOnTick(3, 230.34375);
        expectToChangeOnTick(5, 695.1875);
        expectToChangeOnTick(4, 462.765625);
        expectToChangeOnTick(2, 115.171875);
        expectToChangeOnTick(3, 288.96875);
        expectToChangeOnTick(1, 57.5859375);
        expectToChangeOnTick(2, 173.2773438);
    });
});
