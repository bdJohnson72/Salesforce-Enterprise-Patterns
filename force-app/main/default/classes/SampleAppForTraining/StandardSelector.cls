/**
 * Created by Brooks Johnson - Insulet on 5/1/23.
 */



    public inherited sharing abstract class StandardSelector extends fflib_SObjectSelector {

        public StandardSelector(){
            super(false, DataAccess.USER_MODE);
        }
        /**
         * Override base method to make use of inherited sharing
         * @param idSet sobject Ids for this selector
         *
         * @return  List of query results
         */
        public override List<SObject> selectSObjectsById(Set<Id> idSet){
            return Database.query(buildQuerySObjectById());
        }
    }