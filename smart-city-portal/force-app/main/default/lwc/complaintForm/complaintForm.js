import { LightningElement, track } from 'lwc';
import createComplaint from '@salesforce/apex/ComplaintHandler.createComplaint';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class ComplaintForm extends LightningElement {
    @track citizenName = '';
    @track email = '';
    @track phone = '';
    @track department = '';
    @track description = '';
    @track priority = '';

    departmentOptions = [
        { label: 'Roads', value: 'Roads' },
        { label: 'Water', value: 'Water' },
        { label: 'Electricity', value: 'Electricity' },
        { label: 'Others', value: 'Others' }
    ];

    priorityOptions = [
        { label: 'Low', value: 'Low' },
        { label: 'Medium', value: 'Medium' },
        { label: 'High', value: 'High' },
        { label: 'Critical', value: 'Critical' }
    ];

    handleChange(event) {
        this[event.target.dataset.field] = event.target.value;
    }

    handleSubmit() {
        createComplaint({
            citizenName: this.citizenName,
            email: this.email,
            phone: this.phone,
            department: this.department,
            description: this.description,
            priority: this.priority
        })
        .then(() => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',
                    message: 'Complaint submitted successfully!',
                    variant: 'success'
                })
            );
            this.clearForm();
        })
        .catch(error => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error submitting complaint',
                    message: error.body.message,
                    variant: 'error'
                })
            );
        });
    }

    clearForm() {
        this.citizenName = '';
        this.email = '';
        this.phone = '';
        this.department = '';
        this.description = '';
        this.priority = '';
    }
}
