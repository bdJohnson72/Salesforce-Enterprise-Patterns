/**
 * Created by Brooks Johnson - Insulet on 5/1/23.
 */

public with sharing class ContactAppService {

    public static void updateContact(Contact contact){
        updateContacts(new List<Contact>{contact});
    }

    public static void updateContacts(List<Contact> contactToUpdate){
        try {
           fflib_ISObjectUnitOfWork unitOfWork = SampleApplication.unitOfWork.newInstance();
            unitOfWork.registerDirty(contactToUpdate);
            createVerificationTask(contactToUpdate, unitOfWork);
            unitOfWork.commitWork();
        } catch (Exception e) {
            //log and rethrow
        }
    }



    private static void createVerificationTask(List<Contact> contacts, fflib_ISObjectUnitOfWork unitOfWork){
        for (Contact contact : contacts){
            Task task = new Task();
            task.WhoId = contact.OwnerId;
            task.Subject = 'Verify changes to the contact are correct';
            unitOfWork.registerNew(task);
        }

    }
}