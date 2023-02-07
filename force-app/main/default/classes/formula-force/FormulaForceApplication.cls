/**
 * Created by bjohnson on 1/23/23.
 */

public with sharing class FormulaForceApplication {

    public static final fflib_Application.UnitOfWorkFactory unitOfWork =
            new fflib_Application.UnitOfWorkFactory(
                    new List<SObjectType>{
                            Driver__c.SObjectType,
                            Season__c.SObjectType,
                            Race__c.SObjectType,
                            Contestant__c.SObjectType
                    }

            );

    public static final fflib_Application.DomainFactory domain =
            new fflib_Application.DomainFactory(FormulaForceApplication.selector,
                    new Map<SObjectType, Type> {
                            Team__c.SObjectType => Teams.Constructor.class,
                            RaceData__c.SObjectType => Races.Constructor.class,
                            Car__c.SObjectType => Cars.Constructor.class,
                            Driver__c.SObjectType => Drivers.Constructor.class,
                            Contestant__c.SObjectType => Contestants.Constructor.class
                    }
            );

    public static final fflib_Application.ServiceFactory service =
            new fflib_Application.ServiceFactory(new Map<Type, Type>{
                    RaceService.class => RaceServiceImpl.class
            });

    public static final fflib_Application.SelectorFactory selector =
            new fflib_Application.SelectorFactory(
                    new Map<SObjectType, Type>{
                            Contestant__c.SObjectType => ContestantSelector.class
                    }
            );

            public static void throwAuraHandledException(Exception e){
                String message = e.getMessage();
                AuraHandledException error = new AuraHandledException(message);
                error.setMessage(message);
                throw error;
            }

}