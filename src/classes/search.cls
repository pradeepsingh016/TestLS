public class search{

 public List<Account> lstaccount{get;set;}
 public string searchItem{get;set;}
 public Boolean isError1{get;set;}
 
 
 public search()
 {
     lstaccount = new List<Account>();
     
 }
 
 public PageReference goSearch()
 {
 
   
    if(string.isNotBlank(searchItem))
    {
    String SelectString='SELECT Name,BillingState,Phone,Website from Account';
    String filter=' Where name like '+'\'%'+searchItem+'%\'';
    String DynamicUserFilter=SelectString+filter;
    lstaccount = Database.query(DynamicUserFilter);
    isError1=false;
    }       
         
        if(lstaccount.size()<=0)
        {
      
            isError1=true;
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'Account not found'));
        }
        
        else if(string.isBlank(searchItem))
         {
            isError1=true;
            lstaccount=null;
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'Search is empty'));
         }   
           
     
         
        return null;
 
     }
}