///<reference path="humanPriority.ts"/>
///<reference path="../typings/tsd/jasmine/jasmine.d.ts"/>

describe('HumanPriority', function () {
    it('should map to the right prio id', function () {
        var x = {
            'Low': 3,
            'Normal-': 25,
            'Normal': 4,
            'Normal+': 24,
            'High': 5,
            'High+': 61,
            'Urgent': 6,
            'Immediate': 7
        }
    });
});
