/**
 * Created by Brooks Johnson - Insulet on 2/7/23.
 */

public with sharing abstract class FormulaForceSelector extends fflib_SObjectSelector {

    public FormulaForceSelector(){
        this(false);
    }

    public FormulaForceSelector(Boolean includeFieldSets){
        //disable base class security checks
        this(includeFieldSets, false, false);
    }


    public FormulaForceSelector(Boolean includeFieldSets, Boolean enforceCrud, Boolean enforceFLS){
        //disable sorting helps performance
        super(includeFieldSets, enforceCrud, enforceFLS, false);
    }
}