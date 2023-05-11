/**
 * Created by Brooks Johnson - Insulet on 5/1/23.
 */

public with sharing class ScrubPIIService {

    public class ScrubPIIServiceException extends Exception{}

    public interface IPIIScrub{
         void scrub();
    }

    public static void scrubPII(Set<Id> recordsIdsToScrub){
        fflib_ISObjectUnitOfWork unitOfWork = SampleApplication.unitOfWork.newInstance();
        //we can use or domain factory to get the correct instance of a domain class based on record Ids
        //This requires that all IDs be the same type
        fflib_SObjects domain = (fflib_SObjects) SampleApplication.domain.newInstance(recordsIdsToScrub);
        if (domain instanceof IPIIScrub) {
            // lets make sure that the domain class we got back inplements our interface
            //if it does we can down cast to the IPIIScrub type
            IPIIScrub scrub = (IPIIScrub) domain;
            scrub.scrub();
            try {
                unitOfWork.registerDirty(domain.getRecords());
                unitOfWork.commitWork();
            }catch (Exception e) {
                System.debug(e.getMessage());
                //log
                throw new ScrubPIIServiceException(e.getMessage());
            }

        }else {
            throw new ScrubPIIServiceException('This class does not implement the IPIIScrub interface');
        }

    }

}