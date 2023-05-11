/**
 * Created by Brooks Johnson - Insulet on 5/1/23.
 */

public with sharing class SampleApplication {

    public static final fflib_Application.UnitOfWorkFactory unitOfWork = new UOWStandardFactory(
            new List<SObjectType>{
                    Account.SObjectType,
                    Contact.SObjectType,
                    Case.SObjectType,
                    Task.SObjectType
            }
    );

    public static final fflib_Application.SelectorFactory selector = new fflib_Application.SelectorFactory(
            new Map<SObjectType, Type>{
                    Contact.SObjectType => ContactSelector.class
            }
    );

    public static final fflib_Application.DomainFactory domain = new fflib_Application.DomainFactory(selector,
            new Map<SObjectType, Type>{
                    Contact.SObjectType => Contacts.Constructor.class,
                    Account.SObjectType => Accounts.Constructor.class,
                    Lead.SObjectType => Leads.Constructor.class
            }
    );



}