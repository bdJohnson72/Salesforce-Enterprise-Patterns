/**
 * Created by Brooks Johnson - Insulet on 1/27/23.
 */

public with sharing class RaceSelector extends fflib_SObjectSelector {

    public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField>{
                RaceData__c.Id,
                Race__c.Name
        };
    }

    public Schema.SObjectType getSObjectType() {
        return Race__c.SObjectType;
    }

    public List<Race__c> selectByIdWithContestants(set<Id> raceIds){
        fflib_QueryFactory raceQueryFactory = newQueryFactory();
       fflib_QueryFactory contestQueryFactory = new ContestantSelector()
               .addQueryFactorySubselect(raceQueryFactory);
        return (List<Race__c>) Database.query(raceQueryFactory.setCondition('Id in : raceIds').toSOQL());
    }
}