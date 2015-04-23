///<reference path="../typings/tsd/jquery/jquery.d.ts"/>
///<reference path="humanPriority.ts"/>

class Issue {
    constructor(public id:number, public numericalPriority:number) {
    }

    updateIssuePriority(priority:number) {
        this.numericalPriority = priority;
        this.sendUpdateToServer();
    }

    sendUpdateToServer() {
        var csrfToken = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type: 'POST',
            url: '/issues/bulk_update',
            data: {
                ids: [this.id],
                _method: 'post',
                authenticity_token: csrfToken,
                issue: {
                    custom_field_values: {
                        5: this.numericalPriority
                    }
                }
            },
        });
    }
}

/*

 Notes
 -----

 this is the textual issue[priority]: priority_id: 5 (e.g. 5=high, 6=urgent, ...)

 Bulk update:

 $.post('/issues/bulk_update', {
 backUrl: '/projects/bla/issues',
 'ids[]': this.id,
 'issue[priority_id]': 6, // 5
 _method: 'post',
 authenticity_token: csrfToken,
 custom_fields: [{
 value: 77, id: 5
 }]
 });


 This ends up in a redirect loop:

 $.ajax({
 type: 'PUT',
 url: '/issues/' + this.id,
 data: {
 _method: 'put',
 authenticity_token: csrfToken,
 issue: {
 custom_field_values: {
 5: this.numericalPriority
 }
 }
 },
 });


 */
