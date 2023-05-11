public with sharing class UOWStandardFactory extends fflib_Application.UnitOfWorkFactory {


    public UOWStandardFactory(List<SObjectType> objectTypes){
        super(objectTypes);
    }


    /**
     * @return instance of fflib_ISobjectUnitOfWork in user mode
     */
    public override fflib_ISObjectUnitOfWork newInstance() {
        // Mock?
        if (m_mockUow != null) {
            return m_mockUow;
        }
        return new fflib_SObjectUnitOfWork(m_objectTypes, new fflib_SObjectUnitOfWork.UserModeDML());
    }
}