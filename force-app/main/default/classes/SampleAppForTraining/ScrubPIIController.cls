/**
 * Created by Brooks Johnson - Insulet on 5/1/23.
 */

public with sharing class ScrubPIIController {

    @AuraEnabled
    public static void scrubPII(Id recordId){
        try{
            ScrubPIIService.scrubPII(new Set<Id>{recordId});
        }catch(Exception e){
            throw new AuraHandledException(e.getMessage());
        }
    }
}