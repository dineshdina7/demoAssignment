public class ChildrecordTriggerHandler {
    public static void getChildrecord(list<Childrecord__c> obj){       
        set<Id> ids  = new set<Id>();
        for(Childrecord__c c : obj)
        {
            ids.add(c.Parent__c);
        }
        list<Childrecord__c> childRecord1 = [SELECT Id, Name, isApproved__c, Parent__c FROM Childrecord__c where Parent__c =: ids And isApproved__c =True];
        integer count =childRecord1.size();
        list<Parent__c> parList = new list<Parent__c>();
        for(Id s :ids)
        {
            if(count == 0)
            {
                Parent__c d= new Parent__c();
                d.Id =s;
                d.Child_Approved_Status__c= ' ';
                parList.add(d);
                update parList;
            }else if(count == 1)
            {
                Parent__c d= new Parent__c();
                d.Id =s;
                d.Child_Approved_Status__c= '1 child approved';
                parList.add(d);
                update parList;
            }else if(count == 2)
            {
                Parent__c d= new Parent__c();
                d.Id =s;
                d.Child_Approved_Status__c= '2 children approved';
                parList.add(d);
                update parList;
            }else{
                Parent__c d= new Parent__c();
                d.Id =s;
                d.Child_Approved_Status__c= 'All child approved';
                parList.add(d);
                update parList;
            }
        }
    }
    
}