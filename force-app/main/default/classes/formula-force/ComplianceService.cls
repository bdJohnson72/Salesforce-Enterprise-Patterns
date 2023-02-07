/**
 * Created by Brooks Johnson - Insulet on 2/2/23.
 */

public with sharing class ComplianceService {


    public static void verify(Set<Id> recordIds) {
        fflib_IDomain domain = FormulaForceApplication.domain.newInstance(recordIds);
        if (domain instanceof Icompliant) {
            ICompliant complaintDomain = (ICompliant) domain;
            List<VerifyResult> verifyResults = complaintDomain.verifyCompliance();
            if (verifyResults != null) {
                List<VerifyResult> failedCompliances = new List<VerifyResult>{
                };
                for (VerifyResult result : verifyResults) {
                    if (!result.passed) {
                        failedCompliances.add(result);
                        if (failedCompliances.size() > 0) {
                            throw new ComplianceException('Compliance failures found', failedCompliances);
                        }
                    }
                }

            }
            return;
        }
        throw new ComplianceException('Unable to verify compliance', null);

    }

    public class ComplianceException extends Exception {
        public List<VerifyResult> failures {get; private set; }

        public ComplianceException(String message, List<VerifyResult> failures){
            this(message);
            this.failures = failures;
        }
    }

    public interface Icompliant {
        List<VerifyResult> verifyCompliance();
    }

    public class VerifyResult {
        public Id recordId;
        public String complianceCode;
        public Boolean passed;
        public String failureReason;
    }

}