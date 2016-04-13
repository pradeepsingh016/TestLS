public class TH_UpdateAccountId
{
    List<Contact>lstcot;
    List<String>emailFirstsplit;
    List<String>emailSecondsplit;
    List<Account>lstacc;
    String website;
    List<String> urls;
    
    public TH_UpdateAccountId(List<Contact>lsttrg)
    {
        lstcot = new List<Contact>();
        lstcot = lsttrg;
        emailFirstSplit = new List<String>();
        emailSecondSplit = new List<String>();
        urls = new List<String>();
    }
    
    public void UpdateId()
    {
          for(Contact c: lstcot){
              emailFirstSplit = c.Email.split('@');
          }
              emailSecondSplit = emailFirstSplit[1].split('\\.');
              
              //if email address is like abc@in.abc.com
              if(emailSecondSplit.size() > 2)
              {
                  website = 'www.'+emailSecondSplit[emailSecondSplit.size()-2]+'.'+emailSecondSplit[emailSecondSplit.size()-1];
                  urls.add(website);
                  website = emailSecondSplit[emailSecondSplit.size()-2]+'.'+emailSecondSplit[emailSecondSplit.size()-1];
                  urls.add(website);
              }
              //if email address is like abc@abc.com
              else
              {
                  website = 'www.'+emailFirstSplit[1];
                  urls.add(emailFirstSplit[1]);
                  urls.add(website);
              }
                           
              lstacc = [SELECT ID From Account where Website IN : urls];
                                        
              if(lstacc.size()>0)
              {
                  for(Contact c: lstcot)
                  {
                   c.AccountId = lstacc[0].Id;
                  }
                  
              }    
         
         }
                    
    
    
}