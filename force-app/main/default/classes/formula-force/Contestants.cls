/**
 * Created by Brooks Johnson - Insulet on 1/31/23.
 */

public inherited sharing class Contestants extends ApplicationDomain{

    public Contestants(List<Contestant__c> contestants){
        super(contestants);
    }

    public override void onValidate(){
        Set<Id> raceIds = new Set<Id>();
        for (Contestant__c contestant : (List<Contestant__c>)Records){
            raceIds.add(contestant.Race__c);
        }
        Map<Id, Race__c> associatedRaces = new Map<Id, Race__c>(new RaceSelector().selectById(raceIds));

        for (Contestant__c contestant : (List<Contestant__c>)Records){
            Race__c race = associatedRaces.get(contestant.Race__c);
            if (race.Status__c != 'Scheduled') {
                contestant.addError('Contestants can only be added to scheduled races');
            }
        }
    }

    public override void onValidate(Map<Id, SObject>existingRecords){
       List<Contestant__c> changedDrivers = getChangedRecords(new Set<SObjectField>{Contestant__c.Driver__c});
        Map<Id, Race__c> associatedRaces = queryAssociatedRaces(changedDrivers);
        for (Contestant__c contestant : changedDrivers){
            Race__c contestantRace = associatedRaces.get(contestant.Race__c);
            if (contestantRace.Status__c != 'Scheduled') {
                contestant.Driver__c.addError('You can only change drivers for scheduled races');
            }
        }
    }

    private Map<Id, Race__c> queryAssociatedRaces(List<Contestant__c> changedDrivers){
        Set<Id> raceIds = new Set<Id>();
        for (Contestant__c contestant : changedDrivers){
            raceIds.add(contestant.Race__c);
        }
        return new Map<Id, Race__c>(new RaceSelector().selectById(raceIds));

    }
    public class Constructor implements fflib_SObjectDomain.IConstructable {
        public fflib_SObjectDomain construct(List<SObject> sObjectList) {
            return new Contestants(sObjectList);
        }
    }
    public void awardChampionshipPoints(fflib_ISObjectUnitOfWork uow){
        Map<Integer, ChampionshipPoints__mdt> pointsByTrackPosition =
                new ChampionshipPointsSelector().pointsByTrackPosition();
        for (Contestant__c contestant : (List<Contestant__c>)Records){
            ChampionshipPoints__mdt pointsForPosition = pointsByTrackPosition.get(Integer.valueOf(contestant.RacePosition__c));
            if (pointsForPosition != null) {
                contestant.ChampionshipPoints__c = pointsForPosition.Points_Awarded__c;
                uow.registerDirty(contestant);
            }
        }
    }

}