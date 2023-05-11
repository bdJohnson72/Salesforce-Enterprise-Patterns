/**
 * Created by bjohnson on 5/1/23.
 */

import {LightningElement, api,  track } from 'lwc';
import getContact from '@salesforce/apex/ContactsAppController.getContactInformation';
import updateContact from '@salesforce/apex/ContactsAppController.updateContactInformation';

export default class ContactCreationForm extends LightningElement {
    contact;
    @api recordId;

    connectedCallback() {
        this.fetchContactInformation();
    }

    async fetchContactInformation() {
        try {
            let contact = await getContact({contactId: this.recordId});
            this.contact = contact;
        } catch (e) {
            console.error(e.getMessage());
        }
    }

    handleChange(event) {
        this.contact[event.target.name] = event.target.value;
    }

    handleSubmit(event) {
        event.preventDefault();
        this.updateContactInformation(this.contact);

    }

    async updateContactInformation(contactInfo) {
        try {
            await updateContact({jsonContact: JSON.stringify(contactInfo)});

        } catch (e) {
            console.error(e.getMessage());
        }
    }
}