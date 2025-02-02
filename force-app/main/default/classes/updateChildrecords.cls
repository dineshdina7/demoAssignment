public with sharing class updateChildrecords {
    @AuraEnabled
    public static string updatechld(string Id) {
        //system.debug(Id);
        Childrecord__c newChld = new Childrecord__c();
        newChld.Id = Id;
        newChld.isApproved__c =true;
        update newChld;
        //system.debug('After update---' + newPro);
        return 'The record is approved';



   }
}