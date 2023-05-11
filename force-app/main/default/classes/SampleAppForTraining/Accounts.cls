/**
 * Created by Brooks Johnson - Insulet on 5/2/23.
 */

public with sharing class Accounts extends fflib_SObjects implements ScrubPIIService.IPIIScrub {


    public Accounts(List<Account> accounts){
        super(accounts, Account.SObjectType);
    }


    public void scrub() {
        for(Account account : (List<Account>)getRecords()){
            Account.ShippingState = '';
            Account.ShippingCity = '';
            Account.BillingState = '';
            Account.BillingCity = '';
        }
    }

    public class Constructor implements fflib_IDomainConstructor {
        public fflib_SObjects construct(List<Object> objectList){
            return new Accounts((List<SObject>) objectList);
        }
    }
}