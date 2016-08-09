public class MyController {

    public Account account;
    private List<Account> lstaccount;
    
    private string accID;
    public Boolean isShowAccount{get;set;}
    

    public MyController() {
        lstaccount = new List<Account>();
        accId ='';
        accId = ApexPages.currentPage().getParameters().get('id'); 
        
        if(string.isNotBlank(accId))
        {
              lstaccount = [SELECT Id, Name, BillingCity, Site FROM Account 
                   WHERE Id = :accId ];
  
       
        
        if(!lstaccount.isEmpty())
        {
            isShowAccount = true;
            account = lstaccount[0];
        }
        
        
      }
      else
        {
            isShowAccount = false;
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'Please contact your system administrator'));
        }
     
     }     

    public Account getAccount() {
        return account;
    }

    public PageReference save() {
    
        update account;
        PageReference currentPage = new PageReference('/'+account.Id); 
        return currentPage;
    }
}