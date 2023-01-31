/**
 * Created by Brooks Johnson - Insulet on 1/28/23.
 */

public interface IRaceService {
   Map<Id, List<RaceService.ProvisionalResult>> calculateProvisionalResults(Set<Id>raceIds);
   void applyRaceResults(Map<Id,List<RaceService.ProvisionalResult>> provisionalResultsByRaceId);
   void awardChampionshipPoints(Set<Id> raceIds);
}