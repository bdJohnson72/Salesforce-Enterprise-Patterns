/**
 * Created by bjohnson on 1/23/23.
 */

public with sharing class ContestantController {

    @AuraEnabled
    public static void awardPoints(String ids){
        try {
            ContestantService.awardChampionshipPoints(null);
        } catch (Exception e) {
            FormulaForceApplication.throwAuraHandledException(e);
        }
    }
}