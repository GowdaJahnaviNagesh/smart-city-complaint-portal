import { LightningElement, track } from 'lwc';
import { subscribe, onError } from 'lightning/empApi';

export default class CdcSubscriber extends LightningElement {
    channelName = '/data/Complaint__ChangeEvent';
    @track lastChangeEvent;

    connectedCallback() {
        onError(error => console.error(error));
        const replayId = -1;
        subscribe(this.channelName, replayId, this.handleChangeEvent.bind(this));
    }

    handleChangeEvent(message){
        console.log('CDC Event received::', JSON.stringify(message));
        this.lastChangeEvent = message.data.payload;
    }
}
