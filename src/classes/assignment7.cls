/*

Class Name: assignment 7
Purpose: To show list of selected accounts from list of all accounts
Created By: Pradeep Singh
Created Date: 1/9/2015 (mm/dd/yyyy)

Change History:
-----------------------------------------------------------------------------------------------------------
Modification Reason                                Modified By                    Modified Date
-----------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------

*/

public class assignment7
{
    
    public List<selectAccountWrapper> listWrap{get;set;} //This variable is used to store list of all accounts with their checkbox value
    public List<Account> listWrapSelected{get;set;} //This variable is used to store list of all selected accounts
    public List<Account> listacc{get;set;} //This variable is used to store list of all accounts
    public Boolean isBlank {get;set;} 
    
    public assignment7()
    {
            listWrap = new List<selectAccountWrapper>();
            listWrapSelected= new List<Account>();
            listacc = new List<Account>();
            isBlank = false;
            
            listacc = [SELECT ID,
                              NAME,
                              PHONE
                          FROM Account];
                          
           for(Account a:listacc)
           {
               listWrap.add(new selectAccountWrapper(a,false));
           }
    }
    
    //Function is used to show list of selected Accounts
    public PageReference showSelectedAccount()
    {
        listWrapSelected.clear();
        for(selectAccountWrapper s: listWrap)
        {
            
           
            if(s.check == true)
            {
                listWrapSelected.add(s.acc);
            }
        }
        
        if(listWrapSelected.size()<=0)
        {
            isBlank = true;
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO,'No Account Selected'));
        }
        
        listWrap.clear();
        listacc = [SELECT ID,
                              NAME,
                              PHONE
                          FROM Account];
                          
           for(Account a:listacc)
           {
               listWrap.add(new selectAccountWrapper(a,false));
           }
        return null;
    }
    
    
    //Wrapper Class which contain Account object and checkbox Value
    public class selectAccountWrapper
    {
        public Account acc{get;set;}
        public Boolean check{get;set;}
        
        public selectAccountWrapper( Account a, Boolean c)
        {
            acc = a;
            check = c;
            
            
        }
    }
}