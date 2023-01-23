/**
 * Created by bjohnson on 1/23/23.
 */

public with sharing class RaceController {

    public static void awardPoints(Set<Id> contestantIds){
        RaceService.awardChampionshipPoints(null);
    }
}