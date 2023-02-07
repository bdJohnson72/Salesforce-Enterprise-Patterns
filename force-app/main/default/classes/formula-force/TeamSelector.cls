/**
 * Created by Brooks Johnson - Insulet on 2/7/23.
 */

public with sharing class TeamSelector extends fflib_SObjectSelector {

    public List<Schema.SObjectField> getSobjectFieldList(){
        return new List<Schema.SObjectField> {
                Team__c.Id,
                Team__c.Name,
                Team__c.Testing_Distance__c
        };
    }
        public Schema.SObjectType getSobjectType() {
            return Team__c.SObjectType;
        }
}