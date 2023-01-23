/**
 * Created by Brooks Johnson - Insulet on 1/23/23.
 */

public with sharing class SeasonController {

    @AuraEnabled
    public static void sendNewsLetter(){
        SeasonService.issueNewsLetter(null);
    }
}