/**
 * Created by Brooks Johnson - Insulet on 1/24/23.
 */

public with sharing class ContestantSelector  extends FormulaForceSelector {

    public List<Schema.SObjectField> getSObjectFieldList(){
        return new List<Schema.SObjectField>{
                Contestant__c.Id,
                Contestant__c.Name,
                Contestant__c.DNF__c,
                Contestant__c.Driver__c,
                Contestant__c.QualificationLapTime_1__c,
                Contestant__c.QualificationLapTime_2__c,
                Contestant__c.QualificationLapTime_3__c,
                Contestant__c.Race__c,
                Contestant__c.RacePosition__c,
                Contestant__c.RaceTime__c,
                Contestant__c.GridPosition__c
        };
    }

   public Schema.SObjectType getSObjectType(){
       return Contestant__c.SObjectType;
   }
   public List<Contestant__c> selectById(Set<Id> ids) {
       return (List<Contestant__c>) super.selectSObjectsById(ids);
   }

    public override  String getOrderBy(){
        return 'Race__r.Season__r.Name, Race__r.Name, RacePosition__c';
    }

    public List<Contestant__c> selectByIdWithDriver(Set<Id> driverIds) {
        fflib_QueryFactory contestantQueryFactory = newQueryFactory();
        new DriversSelector().configureQueryFactoryFields(contestantQueryFactory,
                Contestant__c.Driver__c.getDescribe().getRelationshipName());

        return Database.query(contestantQueryFactory.setCondition('Id in :driverIds').toSOQL());
    }

    public Map<Id, List<Summary>> selectByRaceIdWithContestantSummary(Set<Id> raceIds){
        Map<Id, List<Summary>> summariesByRaceId = new Map<Id, List<Summary>>();

        for(Contestant__c contestant :
                Database.query(
                        newQueryFactory(false).
                                selectField(Contestant__c.RacePosition__c).
                                selectField('Race__r.Name').
                                selectField('Race__r.Season__r.Name').
                                selectField('Driver__r.Name').
                                selectField('Driver__r.Team__r.Name').
                                selectField('Car__r.Name').
                                setCondition('Race__c in :raceIds').
                                toSOQL())) {

            List<Summary> summaries = summariesByRaceId.get(contestant.Race__c);
            if(summaries==null)
                summariesByRaceId.put(contestant.Race__c, summaries = new List<Summary>());
            summaries.add(new Summary(contestant));
        }

        return summariesByRaceId;

    }

    public class Summary {
        private Contestant__c contestant;
        public String Season {
            get{ return this.contestant.Race__r.Season__r.Name;}
        }
        public String Race {
            get {
                return this.contestant.Race__r.Name;}
        }
        public Decimal position {
            get{return this.contestant.RacePosition__c;}
        }
        public String driver {
            get {return this.contestant.Driver__r.Name;}
        }
        public String Team {get {return this.contestant.Driver__r.Team__r.Name;}}

        private Summary(Contestant__c contestant){
            this.contestant = contestant;
        }


    }
}