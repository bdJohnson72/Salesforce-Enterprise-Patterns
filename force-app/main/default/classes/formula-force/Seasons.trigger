/**
 * Created by Brooks Johnson - Insulet on 1/31/23.
 */

trigger Seasons on Season__c (before insert, before update, before delete,
        after insert, after update, after delete, after undelete) {
    fflib_SObjectDomain.triggerHandler(Seasons.class);

}