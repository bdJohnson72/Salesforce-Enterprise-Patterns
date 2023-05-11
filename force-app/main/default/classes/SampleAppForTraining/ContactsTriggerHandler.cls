public inherited sharing class ContactsTriggerHandler extends fflib_SObjectDomain {
    private static final Set<String> shippingCodes = new Set<String>{'US', 'CA'};
    private static final  String INTERNATION_CONTACT_DESCRIPTION = 'Contact is for International team';
    private static final String DOMESTIC_CONTACT_DESCRIPTION = 'Contact is for Domestic team';

    public ContactsTriggerHandler(List<Contact> contactRecords){
        super(contactRecords);
    }

    /**
     * called from the  handleBeforeInsert method
     */
    public override void onApplyDefaults() {
        setDescription(records);
    }
    /**
     * called from the handleAfterInsert method
     */
    public override void onValidate(){
        checkEmail(records);

    }

    /**
     * overloaded method now called from after context and can use
     * the values in Trigger.oldMap (existing records)
     * @param existingRecords
     */
    public override void onValidate(Map<Id, SObject> existingRecords) {
        List<Contact> changedRecords = getChangedRecords(new Set<SObjectField>{Contact.Email});
       checkEmail(getChangedRecords(new Set<SObjectField>{Contact.Email}));

    }

    public override void onBeforeInsert(){
        //call service to  layer if needed
    }
    private void setDescription(List<Contact> contacts) {

        for (Contact contact : contacts){
            if (shippingCodes.contains(contact.MailingCountry)) {
                contact.Description = DOMESTIC_CONTACT_DESCRIPTION;
            }else {
                contact.Description = INTERNATION_CONTACT_DESCRIPTION;
            }
        }
    }

    private void checkEmail(List<Contact> contacts) {
        for (Contact contact : contacts){
            if (String.isEmpty(contact.Email)) {
                contact.addError('Email is required');
            }
        }
    }



    public class Constructor implements fflib_SObjectDomain.IConstructable {
        public fflib_SObjectDomain construct(List<SObject> sObjectList) {
            return new ContactsTriggerHandler(sObjectList);
        }
    }
}