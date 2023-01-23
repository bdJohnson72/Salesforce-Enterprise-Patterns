/**
 * Created by Brooks Johnson - Insulet on 1/23/23.
 */

public with sharing class SeasonNewsLetterScheduler implements Schedulable {


    public void execute(SchedulableContext param1) {
        SeasonService.issueNewsLetter(null);
    }
}