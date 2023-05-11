/**
 * Created by Brooks Johnson - Insulet on 5/1/23.
 */

public with sharing class ContactSelector extends StandardSelector {


    public  SObjectType getSObjectType() {
        return Contact.SObjectType;
    }

    public List<SObjectField> getSObjectFieldList() {
        return new List<SObjectField>{
                Contact.FirstName,
                Contact.LastName,
                Contact.Email,
                Contact.Description,
                Contact.MailingCountry
        };
    }
}