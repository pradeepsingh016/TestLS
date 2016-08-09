public class productOrder
{

    public List<Account> lstaccount{get;set;}
    public productOrder()
    {
      lstaccount = new List<Account>();
      lstaccount = [SELECT Name FROM Account 
                           order by Name LIMIT 10 ];   
                     
  
      
    }
    
     
}