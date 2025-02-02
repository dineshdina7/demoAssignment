trigger childrecordTrigger on Childrecord__c (after insert,after update,after delete,after undelete) {
    if(trigger.isAfter && (trigger.isInsert || trigger.isUpdate || trigger.isUndelete))
    {
    ChildrecordTriggerHandler.getChildrecord(trigger.new);
    }
    if(trigger.isDelete)
    {
    ChildrecordTriggerHandler.getChildrecord(trigger.old);
    }
    }