public with sharing class getParentChildrecords {
    @AuraEnabled(cacheable=true)
    public static List<Parent__c> getParent() {
        return [SELECT Id, Name, (SELECT Id, Name, isApproved__c FROM Childrecords__r) FROM Parent__c ];
    }
}