/**
 * Created by bjohnson on 1/23/23.
 */

public with sharing class ContestantService {
    public class ContestantServiceException extends Exception{}
    public static void awardChampionshipPoints(Set<Id> contestantIds){
       fflib_ISObjectUnitOfWork uow = FormulaForceApplication.unitOfWork.newInstance();
        Contestants contestants = new Contestants(new ContestantSelector().selectById(contestantIds));
        contestants.awardChampionshipPoints(uow);
        uow.commitWork();
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