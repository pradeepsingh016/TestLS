public class assignment6
{
    public List<Contact> lstcnt{get;set;}
    public string accId;
    public Boolean isBlank{get;set;}
    public Boolean showAddContact{get;set;}
    public Account acc;
    public Contact cnt;
    public string contactName{get;set;}
    public Boolean CheckboxVal{get;set;}
    public Boolean refreshPage{get;set;}
    public List<delContactWrapper> lstwrap{get;set;}
    public Boolean isDisabled{get;set;}
    public assignment6(ApexPages.StandardController controller) 
    {
        //refreshPage = false;
        this.acc = (Account)controller.getrecord();    
        cnt = new Contact();
        lstwrap = new List <delContactWrapper>();
        
        lstcnt = new List<Contact>();
            
           
            lstcnt = [SELECT ID,
                         NAME
                    FROM Contact
                    Where accountid =:acc.id];
        
        for(Contact c: lstcnt)
        {
            lstwrap.add(new delContactWrapper(c,false));
        }   
        
        
        if(lstcnt.size()>0)
        {
             isBlank = true;
        }
        else
        {
           isBlank =false; 
        }
        
        
        
    }
    
    public PageReference showContactForm()
    {
        showAddContact = true;
        isDisabled = true;
        return null;
    }
    
    public PageReference saveContact()
    {
          
        cnt.Lastname = contactName;
        cnt.Accountid = acc.id;
        
        insert cnt;
        
       List<Contact> newCon = new List<Contact>();
       newCon =  [SELECT ID,
                         NAME
                    FROM Contact
                    Where accountid =:acc.id];
        
        lstwrap.clear();
        
        for(Contact c:newCon)
        {
            lstWrap.add(new delContactWrapper (c,false));
        }
        
                    
         
        showAddContact = false;
        isDisabled = false;
        return null;
        
    }
    
    
    
    public PageReference deleteContact()
    {
        List<Contact> delContactList = new List<Contact>();
        
        for(delContactWrapper d : lstwrap)
        {
            if(d.delCheck==true)
            {
                delContactList.add(d.con);
            } 
            
        }
        
        if(delContactList.size()>0)
        {
            Database.delete(delContactList , false);
            
        }
        
       List<Contact> newCon = new List<Contact>();
       newCon =  [SELECT ID,
                         NAME
                    FROM Contact
                    Where accountid =:acc.id];
        
        lstwrap.clear();
        
        for(Contact c:newCon)
        {
            lstWrap.add(new delContactWrapper (c,false));
        }
        
        
        
        return null;
    }
    
    
   
    
    //Wrapper class
    public class delContactWrapper
    {
        public Contact con{get;set;}
        public Boolean delCheck{get;set;}
        
        public delContactWrapper(Contact c, Boolean dc)
        {
            con = c;
            delCheck = dc;
        }
        
    }
    //End of Wrapper Class
    
}