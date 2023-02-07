/**
 * Created by Brooks Johnson - Insulet on 1/31/23.
 */

public inherited sharing abstract class ApplicationDomain extends fflib_SObjectDomain {
    public ApplicationDomain(List<SObject> records){
        super(records);
        Configuration.disableTriggerCRUDSecurity();
    }

}