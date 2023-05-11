/**
 * Created by bjohnson on 5/1/23.
 */

import {LightningElement, api} from 'lwc';
import scrubPii from '@salesforce/apex/ScrubPiiController.scrubPII';

export default class ScrubPii extends LightningElement {
    @api recordId;

    @api invoke() {
        this.scrubPii();
    }

    async scrubPii() {
        try {
            await scrubPii({recordId: this.recordId});
        } catch (e) {
            console.log(e);
        }
    }
}