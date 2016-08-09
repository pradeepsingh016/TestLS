public class assignment3
{

    public List<Position__c> lstpos{get;set;}
    
    public assignment3()
    {
        lstpos = new List<Position__c>();
        lstpos = [SELECT Name FROM Position__c];  
    }
}