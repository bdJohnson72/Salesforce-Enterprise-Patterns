/**
 * Created by Brooks Johnson - Insulet on 1/31/23.
 */

public with sharing class Races extends ApplicationDomain {

    public Races(List<Race__c> races){
        super(races);
    }
    public class Constructor implements IConstructable{
        public fflib_SObjectDomain construct(List<SObject> sobjectList){
            return new Races(sobjectList);
        }
    }
}