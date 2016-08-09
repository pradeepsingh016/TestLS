public class assignment4
{
    public List<Position__c> lstpos{get;set;}
    public string searchItem{get;set;}
    public Boolean isBlank {get;set;}
    
   public PageReference dosearch()
   {
       if(string.isNotBlank(searchItem))
       {
           isBlank = false;
           String SelectString = 'SELECT name,Hiring_Manager__c,Min_Pay__c,Max_Pay__c,Status__c from Position__c';
            String Filter = ' Where name like '+'\'%'+searchItem+'%\'';
            String DynamicUserFilter=SelectString+Filter;
            lstpos = Database.query(DynamicUserFilter);
            
             if(lstpos.size()<=0)
            {    
                isBlank = true;
                lstpos=null;
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO,'No Records Found'));    
            }
       
       }
       
            
        
        else
        {
            isBlank = true;
            lstpos=null;
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO,'Warning !! Search Empty'));
        }
       
       return null;
   
   }
   
   /*Comment 2 for github*/

}