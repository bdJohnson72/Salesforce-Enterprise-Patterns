/**
 * Created by Brooks Johnson - Insulet on 2/8/23.
 */

    trigger Contestants on Contestant__c (before insert, before update, before delete,
            after insert, after update, after delete, after undelete) {

        fflib_SObjectDomain.triggerHandler(Contestants.class);

}