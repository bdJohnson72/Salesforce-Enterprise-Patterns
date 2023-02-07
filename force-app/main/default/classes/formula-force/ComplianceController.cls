/**
 * Created by Brooks Johnson - Insulet on 2/3/23.
 */

public with sharing class ComplianceController {

    @AuraEnabled
    public static List<String> verify(Id recordId){
        try {
            ComplianceService.verify(new Set<Id>{recordId});
            return null;
        } catch (Exception e) {
            List<String> messages = new List<String>();
            if (e instanceof ComplianceService.ComplianceException) {
                ComplianceService.ComplianceException ce = (ComplianceService.ComplianceException) e;
                for(ComplianceService.VerifyResult result : ce.failures){
                    messages.add(String.format('{0} ({1})', new List<String>{result.failureReason, result.complianceCode}));
                }
            }
            return messages;
        }
    }
}