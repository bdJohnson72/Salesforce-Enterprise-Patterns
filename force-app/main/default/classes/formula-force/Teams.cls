/**
 * Created by Brooks Johnson - Insulet on 2/7/23.
 */

public with sharing class Teams extends fflib_SObjectDomain
implements ComplianceService.Icompliant {

    public Teams(List<Team__c> teams){
        super(teams);
    }

    public List<ComplianceService.VerifyResult> verifyCompliance(){
        List<ComplianceService.VerifyResult> teamVerifyResults = new List<ComplianceService.VerifyResult>();
        for (Team__c team : (List<Team__c>)Records){
        ComplianceService.VerifyResult result = new ComplianceService.VerifyResult();
            result.complianceCode = '22.5';
            result.recordId = team.Id;
            result.passed = team.Testing_Distance__c != null ? team.Testing_Distance__c <= 1500 : true;
            teamVerifyResults.add(result);
    }
        //verify associated drivers
        teamVerifyResults.addAll( new Drivers(new DriversSelector().selectByTeam(new Map<Id, SObject>(Records).keySet())).verifyCompliance());
        return teamVerifyResults;
    }


    public class Constructor implements IConstructable {
        public fflib_SObjectDomain construct(List<SObject> sobjectList){
            return new Teams(sobjectList);
        }
    }



}