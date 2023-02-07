/**
 * Created by Brooks Johnson - Insulet on 1/31/23.
 */

public inherited sharing class Seasons extends ApplicationDomain{

    public Seasons(List<Season__c> seasons){
        super(seasons);
    }

    public class Constructor implements IConstructable{
        public fflib_SObjectDomain construct(List<Sobject> sobjectList){
            return new Seasons(sobjectList);
        }
    }
}