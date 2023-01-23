/**
 * Created by bjohnson on 1/23/23.
 */

public with sharing class RaceService {

    public static void awardChampionshipPoints(Set<Id> raceIds){
        ContestantService.awardChampionshipPoints(null);
    }
}