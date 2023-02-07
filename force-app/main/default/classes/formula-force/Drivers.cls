/**
 * Created by Brooks Johnson - Insulet on 2/1/23.
 */

public inherited sharing class Drivers extends ApplicationDomain
    implements ComplianceService.Icompliant{

    public Drivers(List<Driver__c> drivers){
        super(drivers);
    }

    public override void onApplyDefaults(){
        for (Driver__c driver : (List<Driver__c>) Records){
            String lastName = driver.Name.substringAfterLast(' ');
            driver.ShortName__c = lastName.left(3).toUpperCase();
        }
    }

    public List<ComplianceService.VerifyResult> verifyCompliance(){
        List<ComplianceService.VerifyResult> compliances = new List<ComplianceService.VerifyResult>();

        for(Driver__c driver : (List<Driver__c>) Records){
            ComplianceService.VerifyResult license = new ComplianceService.VerifyResult();
            license.complianceCode = '4.1';
            license.recordId = driver.Id;
            license.passed = driver.FIASuperLicense__c;
            license.failureReason = license.passed ? null :
            'Driver must have FIA Super License';
            compliances.add(license);
        }
        return compliances;
    }

    public class Constructor implements IConstructable {

        public fflib_SObjectDomain construct(List<SObject> sObjectList) {
            return new Drivers(sObjectList);
        }
    }
}