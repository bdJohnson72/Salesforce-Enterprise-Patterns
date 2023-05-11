/**
 * Created by Brooks Johnson - Insulet on 5/1/23.
 */

@IsTest
private class ContactsTriggerHandlerTest {
    @IsTest
    static void validateErrorOnChangedEmail() {
        Contact testContact = new Contact(Id = fflib_IDGenerator.generate(Contact.SObjectType),
                Email ='test@example.com');

        ContactsTriggerHandler handler = new ContactsTriggerHandler(new List<Contact>{testContact});

        handler.onValidate();
        Assert.isFalse(testContact.hasErrors(), 'No errors should have been added');

    }

    @IsTest
    static void validateErrorOnNewEmail() {
        Contact testContact = new Contact(Id = fflib_IDGenerator.generate(Contact.SObjectType), Email ='');
        Contact oldContact = new Contact(Id = testContact.Id, Email = 'test@example.com');
        ContactsTriggerHandler handler = new ContactsTriggerHandler(new List<Contact>{testContact});
        handler.ExistingRecords = new Map<Id, SObject>{testContact.Id => oldContact};
        handler.onValidate(handler.ExistingRecords);
        Assert.isTrue(testContact.hasErrors(), 'Should have errors');
    }
}