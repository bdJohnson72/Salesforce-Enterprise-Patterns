public inherited sharing class Contacts extends fflib_SObjects
        implements ScrubPIIService.IPIIScrub{
    private static final Set<String> DOMESTIC_SHIPPING_CODES = new Set<String>{'US', 'CA'};

    //Domain classes are meant to be instantiated with the SOBject records required for domain operations.
    public Contacts(List<Contact> contactRecords){
        super(contactRecords, Contact.SObjectType);
    }

    /**
     * In our Trigger handler implementation we were concered with logic during
     * database operations. The domain class will contain method to be called from the service layer
     *
     * @return a list of contacts with International mailing addresses
     */
    public List<Contact> filterInternationalContacts(){
        List<Contact> internationalContacts = new List<Contact>();
        for(Contact contact : (List<Contact>)getRecords() ){
            if(!DOMESTIC_SHIPPING_CODES.contains(contact.MailingCountry)){
                internationalContacts.add(contact);
            }
        }
        return internationalContacts;
    }

    //Used by the Application class for reflection purposes
    public class Constructor implements fflib_IDomainConstructor
    {
        public fflib_SObjects construct(List<Object> objectList)
        {
            return new Contacts((List<SObject>) objectList);
        }
    }

    public void scrub() {
        for(Contact contact : (List<Contact>)getRecords() ){
            contact.FirstName = 'Scrubbed';
            contact.LastName = 'Scrubbed';
           contact.Birthdate = Date.newInstance(1900, 01, 01);
        }
    }
}