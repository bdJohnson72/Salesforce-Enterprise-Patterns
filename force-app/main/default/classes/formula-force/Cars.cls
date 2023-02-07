/**
 * Created by Brooks Johnson - Insulet on 2/2/23.
 */

public inherited sharing class Cars extends ApplicationDomain
implements ComplianceService.Icompliant {

    public Cars(List<Car__c> cars){
        super(cars);
    }

    public List<ComplianceService.VerifyResult> verifyCompliance(){
        List<ComplianceService.VerifyResult> compliances =
                new List<ComplianceService.VerifyResult>();

        for (Car__c car : (List<Car__c>)Records){
            ComplianceService.VerifyResult license =
                    new ComplianceService.VerifyResult();
            license.complianceCode = '4.1';
            license.recordId = car.Id;
            license.passed = car.Weight__c != null
                    && car.Weight__c >= 691;

            license.failureReason = license.passed ? null :
            'Car weight must not be less that 691kg';
            compliances.add(license);
        }
        return compliances;
    }


    public class Constructor implements fflib_SObjectDomain.IConstructable {
        public fflib_SObjectDomain construct(List<SObject> sObjectList) {
            return new Contestants(sObjectList);
        }
    }

}