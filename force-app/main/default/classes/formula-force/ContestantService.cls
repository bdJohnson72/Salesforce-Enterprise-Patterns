/**
 * Created by bjohnson on 1/23/23.
 */

public with sharing class ContestantService {
    public class ContestantServiceException extends Exception{}
    public static void awardChampionshipPoints(Set<Id> contestantIds){
       fflib_ISObjectUnitOfWork uow = FormulaForceApplication.unitOfWork.newInstance();
        awardChampionshipPoints(uow, new ContestantSelector().selectById(contestantIds));
        uow.commitWork();
    }

    public static void awardChampionshipPoints(fflib_ISObjectUnitOfWork uow, List<Contestant__c> contestants){
        Map<Integer, ChampionshipPoints__mdt> pointsByTrackPosition = new ChampionshipPointsSelector().pointsByTrackPosition();
        for (Contestant__c contestant : contestants){
          ChampionshipPoints__mdt points =
                 pointsByTrackPosition.get(Integer.valueOf(contestant.RacePosition__c));
            if (points != null) {
               contestant.ChampionshipPoints__c = points.Points_Awarded__c;
                uow.registerDirty(contestant);
            }
        }

    }
    public static void retireFromRace(List<RaceRetirement> retirements){
        //TODO implement this
        throw new ContestantServiceException('Not Implemented');
    }
    public class RaceRetirement{
        public Id contestantId;
        public String reason;
    }
}