/**
 * Created by bjohnson on 1/23/23.
 */

public with sharing class RaceService {

    public class RaceServiceException extends Exception {}

    private static IRaceService service(){
        return  (IRaceService) FormulaForceApplication.service.newInstance(IRaceService.class);
    }

    public static Map<Id, List<ProvisionalResult>> calculateProvisionalResults(Set<Id> raceIds){
        return service().calculateProvisionalResults(raceIds);
    }

    public static void applyRaceResults(Map<Id, List<ProvisionalResult>> provisionalResultByRaceId){
        service().applyRaceResults(provisionalResultByRaceId);
    }

    public static void awardChampionshipPoints(Set<Id> raceIds){
         service().awardChampionshipPoints(raceIds);
    }

    public class ProvisionalResult{
        public Integer racePosition {get; set; }
        public Id contestantId {get; set;}
        public String contestantName {get; set;}
    }
}