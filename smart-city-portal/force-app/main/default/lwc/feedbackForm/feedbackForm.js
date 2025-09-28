import { LightningElement, track, api } from 'lwc';
import createFeedback from '@salesforce/apex/FeedbackHandler.createFeedback';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class FeedbackForm extends LightningElement {
    @api recordId;   // complaintId passed from page
    @track rating = '';
    @track comments = '';

    ratingOptions = [
        { label: '1 - Very Poor', value: '1' },
        { label: '2 - Poor', value: '2' },
        { label: '3 - Average', value: '3' },
        { label: '4 - Good', value: '4' },
        { label: '5 - Excellent', value: '5' }
    ];

    handleChange(event) {
        if (event.target.name === 'rating') {
            this.rating = event.target.value;
        } else if (event.target.name === 'comments') {
            this.comments = event.target.value;
        }
    }

    handleSubmit() {
        createFeedback({ complaintId: this.recordId, rating: parseInt(this.rating), comments: this.comments })
            .then(() => {
                this.dispatchEvent(new ShowToastEvent({
                    title: 'Success',
                    message: 'Thank you for your feedback!',
                    variant: 'success'
                }));
                this.rating = '';
                this.comments = '';
            })
            .catch(error => {
                this.dispatchEvent(new ShowToastEvent({
                    title: 'Error',
                    message: error.body.message,
                    variant: 'error'
                }));
            });
    }
}
