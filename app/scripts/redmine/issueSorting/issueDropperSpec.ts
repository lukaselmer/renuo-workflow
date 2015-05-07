///<reference path="../../models/issue.ts"/>
///<reference path="../../typings/tsd/jasmine/jasmine.d.ts"/>
///<reference path="issueDropper.ts"/>

describe('IssueDropper', function () {
    var issue1:Issue, issue2:Issue, issue3:Issue, issue4:Issue, issue5:Issue;
    var issueDropper:IssueDropper;

    beforeEach(function(){
        issue1 = new Issue(93588, 100);
        issue2 = new Issue(93589, 200);
        issue3 = new Issue(93521, 400);
        issue4 = new Issue(93524, 500);
        issue5 = new Issue(93526, 950);

        spyOn(issue1, 'sendUpdateToServer');
        spyOn(issue2, 'sendUpdateToServer');
        spyOn(issue3, 'sendUpdateToServer');
        spyOn(issue4, 'sendUpdateToServer');
        spyOn(issue5, 'sendUpdateToServer');

        issueDropper = new IssueDropper([issue1, issue2, issue3]);
    });

    it('should have the correct value when issue4 is dropped in between', function () {
        issueDropper.dropIssueBetween(issue4, issue1, issue2);
        expect(issue4.numericalPriority).toEqual(150);
        expect(issue4.sendUpdateToServer).toHaveBeenCalled();
    });

    it('should have the correct value when issue3 is dropped in between', function () {
        issueDropper.dropIssueBetween(issue3, issue1, issue2);
        expect(issue3.numericalPriority).toEqual(150);
        expect(issue3.sendUpdateToServer).toHaveBeenCalled();
    });

    it('should have the correct value when issue3 is dropped on top', function () {
        issueDropper.dropIssueBetween(issue3, null, issue1);
        expect(issue3.numericalPriority).toEqual(50);
        expect(issue3.sendUpdateToServer).toHaveBeenCalled();
    });


    it('should have the correct value when issue3 is dropped to the bottom', function () {
        issueDropper.dropIssueBetween(issue3, issue5, null);
        expect(issue3.numericalPriority).toEqual(975);
        expect(issue3.sendUpdateToServer).toHaveBeenCalled();
    });
});
