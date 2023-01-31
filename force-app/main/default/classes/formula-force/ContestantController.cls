/**
 * Created by bjohnson on 1/23/23.
 */

public with sharing class ContestantController {

    @AuraEnabled
    public static void awardPoints(Id contestantId) {
        try {
            ContestantService.awardChampionshipPoints(new Set<Id>{
                    contestantId
            });
        } catch (Exception e) {
            FormulaForceApplication.throwAuraHandledException(e);
        }
    }
}