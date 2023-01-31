/**
 * Created by bjohnson on 1/23/23.
 */

public with sharing class RaceController {
    @AuraEnabled
    public static void awardPoints(Id raceId){
        try {
            RaceService.awardChampionshipPoints(new Set<Id>{raceId});
        } catch (Exception e) {
            FormulaForceApplication.throwAuraHandledException(e);
        }
    }
}