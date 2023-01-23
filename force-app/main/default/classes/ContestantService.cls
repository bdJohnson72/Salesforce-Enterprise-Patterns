/**
 * Created by bjohnson on 1/23/23.
 */

public with sharing class ContestantService {

    public static void awardChampionshipPoints(Set<Id> contestantIds){}
    public static void retireFromRace(List<RaceRetirement> retirements){
        //TODO implement this
    }
    public class RaceRetirement{
        public Id contestantId;
        public String reason;
    }
}