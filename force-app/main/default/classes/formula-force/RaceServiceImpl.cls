/**
 * Created by Brooks Johnson - Insulet on 1/28/23.
 */

public with sharing class RaceServiceImpl implements IRaceService {
    public Map<Id, List<RaceService.ProvisionalResult>> calculateProvisionalResults(Set<Id> raceIds) {
      throw new RaceService.RaceServiceException('Not Implemented');
    }

    public void applyRaceResults(Map<Id, List<RaceService.ProvisionalResult>> provisionalResultsByRaceId) {
        throw new RaceService.RaceServiceException('Not Implemented');
    }

    public void awardChampionshipPoints(Set<Id> raceIds) {
        fflib_ISObjectUnitOfWork uow = FormulaForceApplication.unitOfWork.newInstance();
        List<Contestant__c> contestantList = new List<Contestant__c>();
        RaceSelector raceSelector = (RaceSelector) FormulaForceApplication.selector.newInstance(Race__c.SObjectType);
        for (Race__c race : raceSelector.selectByIdWithContestants(raceIds)){
            contestantList.addAll(race.Contestants__r);
        }
        //delegate to contestant service
        ContestantService.awardChampionshipPoints(uow, contestantList);
        uow.commitWork();
    }
}