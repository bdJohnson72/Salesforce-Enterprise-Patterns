/**
 * Created by Brooks Johnson - Insulet on 2/7/23.
 */

public inherited sharing class DriversSelector extends fflib_SObjectSelector {
    public   SObjectType getSObjectType() {
     return Driver__c.SObjectType;
    }

     public List<SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField>{
                Driver__c.Id,
                Driver__c.Name,
                Driver__c.FIASuperLicense__c,
                Driver__c.Team__c

        };
    }

    public List<Driver__c> selectByTeam(Set<Id> teamIds){
        return (List<Driver__c>) Database.query(newQueryFactory()
                .setCondition('Team__c in : teamIds')
                .toSOQL());
    }
}