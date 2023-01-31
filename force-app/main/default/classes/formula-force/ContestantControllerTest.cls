/**
 * Created by bjohnson on 1/23/23.
 */

@IsTest
private class ContestantControllerTest {

    @IsTest
    static void testAwardPoints() {
        // TODO: Stub test
        SeasonService.importSeasons(TestData.SEASONSDATA);
        ContestantController.awardPoints([SELECT Id FROM Contestant__c LIMIT 1][0].Id);
    }
}