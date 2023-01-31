/**
 * Created by Brooks Johnson - Insulet on 1/24/23.
 */

public inherited sharing class ChampionshipPointsSelector extends fflib_SObjectSelector{

   public list<Schema.SObjectField> getSObjectFieldList(){
       return new List<Schema.SObjectField>{
               ChampionshipPoints__mdt.Id,
               ChampionshipPoints__mdt.DeveloperName,
               ChampionshipPoints__mdt.Points_Awarded__c
       };
   }



    public Map<Integer, ChampionshipPoints__mdt> pointsByTrackPosition(){
        List<ChampionshipPoints__mdt> championshipPoints = ChampionshipPoints__mdt.getAll().values();
        Map<Integer, ChampionshipPoints__mdt> championshipPointsByPosition = new Map<Integer, ChampionshipPoints__mdt>();
        for (ChampionshipPoints__mdt record : championshipPoints){
            Integer trackPosition = Integer.valueOf(record.DeveloperName.remove('TrackPosition'));
            championshipPointsByPosition.put(trackPosition, record);
        }
        return  championshipPointsByPosition;
    }

    public  SObjectType getSObjectType() {
        return ChampionshipPoints__mdt.SObjectType;
    }
}