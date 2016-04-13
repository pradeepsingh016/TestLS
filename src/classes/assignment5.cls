public class assignment5
{
    public List<AccountWithPC> accWithPC {get;set;}
    public Set<ID> uniqueAccId;
    public List<Account> lstacc;
    public List<Contact> lstcnt;
    public string search {get;set;}
    public Boolean isBlank {get;set;} 
    public Map<ID , Contact> mapPrimary;
    
    
    public assignment5()
    {
       
        uniqueAccId = new Set<ID>();
        lstacc = new List<Account>();
        lstcnt = new List<Contact>();
        mapPrimary = new Map<ID, Contact>();       
    
    }
    
    
    public PageReference dosearch()
    {
        if(string.isNotBlank(search))
        {
            isBlank = false;
            String SelectString = 'SELECT ID, Name, Type, Industry From Account';
            String Filter = ' Where name like '+'\'%'+search+'%\'';
            String DynamicUserFilter=SelectString+Filter;
            lstacc = Database.query(DynamicUserFilter);
            system.debug(lstacc);
            
            
         if(lstacc.size()>0)
          {           
            for(Account a: lstacc)
             {
                 uniqueAccId.add(a.id);
                 
             }
             
             system.debug(uniqueAccId);
             
           lstcnt = [SELECT id,
                            accountid,
                            name
                       FROM Contact
                       Where accountid in : uniqueAccId and Primary_Contact__c = true];
             
            system.debug(lstcnt);
                       
           for(Contact con: lstcnt)
           {
               mapPrimary.put(con.accountid, con);
           }
           system.debug('lstacc--------------->'+lstacc);
            accWithPC = new List<AccountWithPC>();
           for(Account a: lstacc)
           {
               system.debug('a--------------->'+a);
               system.debug('mapPrimary.get(a.id)--------------->'+mapPrimary.get(a.id));
              accWithPC.add(new AccountWithPC(a , mapPrimary.get(a.id) ));
           }
           system.debug(accWithPC);
           
          }//Inner If
         
         else
             {
                 isBlank = true;
                 ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO,'No Records Found')); 
         
             }
         
        }//End of If
        
        else
        {
            isBlank = true;
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO,'Search is Empty'));
        } 
         
        
        return null;
    }
    
    
    
    //Inner Wrapper Class
    public class AccountWithPC
    {
        public Account acc{get;set;}
        public Contact primaryc{get;set;}
        
        public AccountWithPC(Account Acc, Contact Primaryc )
        {
            this.acc= Acc;
            this.primaryc = Primaryc;
        }
    
    }



}