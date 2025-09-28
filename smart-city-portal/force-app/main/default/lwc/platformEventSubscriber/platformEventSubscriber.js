import { LightningElement } from 'lwc';
import { subscribe, unsubscribe, onError } from 'lightning/empApi';

export default class PlatformEventSubscriber extends LightningElement {
    channelName = '/event/Complaint_Event__e';
    subscription = {};

    connectedCallback() {
        onError(error => { console.error(error); });
        const replayId = -1;
        subscribe(this.channelName, replayId, this.messageHandler.bind(this))
            .then(response => { this.subscription = response; });
    }

    messageHandler(message) {
        console.log('Event received:: ', JSON.stringify(message));
    }
}
