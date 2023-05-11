/**
 * Created by Brooks Johnson - Insulet on 5/2/23.
 */

public with sharing class Leads extends fflib_SObjects implements ScrubPIIService.IPIIScrub {

    public Leads(List<Lead> leads){
        super(leads, Lead.SObjectType);
    }


    public void scrub(){
        for(Lead lead : (List<Lead>) getRecords()){
            lead.FirstName ='Scrubbed';
            lead.LeadSource = 'removed';
            lead.Industry = 'unknown';
        }
    }

    public class Constructor implements fflib_IDomainConstructor {
        public fflib_SObjects construct(List<Object> objectList){
            return new Leads((List<SObject>) objectList);
        }
    }

}