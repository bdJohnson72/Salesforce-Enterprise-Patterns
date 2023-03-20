/**
 * Created by Brooks Johnson - Insulet on 2/2/23.
 */

public with sharing class CarSelector extends fflib_SObjectSelector{

    public List<Schema.SObjectField> getSObjectFieldList(){
        return new List<Schema.SObjectField> {
                Car__c.Id,
                Car__c.Name,
                Car__c.Weight__c
        };
    }

    public Schema.SObjectType getSObjectType(){
        return Car__c.SObjectType;
    }

}