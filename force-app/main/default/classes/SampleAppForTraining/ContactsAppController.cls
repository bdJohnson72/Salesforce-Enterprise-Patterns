/**
 * Created by Brooks Johnson - Insulet on 5/1/23.
 */

public with sharing class ContactsAppController {

    @AuraEnabled
    public static Contact getContactInformationBad(String id) {
        //security not handled and we end up with potential duplicate queries all over
        // the code base
    List<Contact> contacts = [SELECT FirstName, LastName, Email,
                    MailingCountry
            FROM Contact
            WHERE Id =:  id];
    return contacts[0];
}

    @AuraEnabled
    public static void saveContact(String id, String firstName, String lastName, String email, String mailingCountry){
        //this is particulary fragile. Methods that have more that 3 parameters are targets for refactoring
        //Often it is sign that they shoudl be working with an object rather than primitives
        //In thhis case should be serializing to a contact SObject
        Contact contact = new Contact();
        contact.Id = id;
        contact.FirstName = firstName;
        contact.LastName = lastName;
        contact.Email = email;
        contact.MailingCountry = mailingCountry;
        update contact;
    }
    @AuraEnabled
    public static Contact getContactInformation(String contactId) {
        try {
            return (Contact) SampleApplication.selector.newInstance(Contact.SObjectType).selectSObjectsById(
                    new Set<Id>{contactId})[0];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled
    public static void updateContactInformation(String jsonContact){
        try{
            ContactAppService.updateContactWithVerifactionTask((Contact) JSON.deserialize(jsonContact, Contact.class));
            //if there was an issue on the update we could be creating tasks for contacts that were never updated

        }catch (Exception e){
            throw new AuraHandledException(e.getMessage());
        }
    }
}