/**
 * Created by Brooks Johnson - Insulet on 1/24/23.
 */

public with sharing class ContestantSelector  extends fflib_SObjectSelector {

    public List<Schema.SObjectField> getSObjectFieldList(){
        return new List<Schema.SObjectField>{
                Contestant__c.Id,
                Contestant__c.Name,
                Contestant__c.DNF__c,
                Contestant__c.Driver__c,
                Contestant__c.QualificationLapTime_1__c,
                Contestant__c.QualificationLapTime_2__c,
                Contestant__c.QualificationLapTime_3__c,
                Contestant__c.Race__c,
                Contestant__c.RacePosition__c
        };
    }

   public Schema.SObjectType getSObjectType(){
       return Contestant__c.SObjectType;
   }
   public List<Contestant__c> selectById(Set<Id> ids) {
       return (List<Contestant__c>) super.selectSObjectsById(ids);
   }
}