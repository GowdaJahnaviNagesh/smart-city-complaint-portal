import { LightningElement, track } from 'lwc';
import createComplaint from '@salesforce/apex/ComplaintHandler.createComplaint';
import getDepartments from '@salesforce/apex/ComplaintHandler.getDepartments';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class ComplaintForm extends LightningElement {
    @track citizenName = '';
    @track email = '';
    @track phone = '';
    @track department = '';   // stores Department Id
    @track description = '';
    @track priority = '';

    departmentOptions = [];
    priorityOptions = [
        { label: 'Low', value: 'Low' },
        { label: 'Medium', value: 'Medium' },
        { label: 'High', value: 'High' },
        { label: 'Critical', value: 'Critical' }
    ];

    // ✅ Load departments dynamically
    connectedCallback() {
        getDepartments()
            .then(data => {
                this.departmentOptions = data.map(dept => {
                    return { label: dept.Name, value: dept.Id };
                });
            })
            .catch(error => {
                this.showToast('Error', error.body.message, 'error');
            });
    }

    handleChange(event) {
        this[event.target.dataset.field] = event.target.value;
    }

    handleSubmit() {
        createComplaint({
            citizenName: this.citizenName,
            email: this.email,
            phone: this.phone,
            departmentId: this.department,  // sending Id, not text
            description: this.description,
            priority: this.priority
        })
        .then(() => {
            this.showToast('Success', 'Complaint submitted successfully!', 'success');
            this.clearForm();
        })
        .catch(error => {
            this.showToast('Error submitting complaint', error.body.message, 'error');
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

    showToast(title, message, variant) {
        this.dispatchEvent(
            new ShowToastEvent({
                title: title,
                message: message,
                variant: variant
            })
        );
    }
}
