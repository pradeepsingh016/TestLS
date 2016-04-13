public class Edit_Account{
    
    public Account acc{get;set;}
    public Contact cnt, emp_con;
    public List<Contact> lstcnt{get;set;}
    public List<Contact> delContactList;
    public List<Contact> newContactList{get;set;}
    public List<Contact> finalContactList{get;set;}
    public List<delContactWrapper> lstwrap{get;set;}
    public Boolean isBlank{get;set;}
    public Boolean isError{get;set;}
    public String Message{get;set;}
    
    public Edit_Account(ApexPages.StandardController controller) {
        this.acc = (Account)controller.getrecord();  
        cnt = new Contact();
        
        lstwrap = new List <delContactWrapper>();
        delContactList = new List<Contact>();
        newContactList = new List<Contact>();
        finalContactList = new List<Contact>();
        lstcnt = new List<Contact>();    
           
            lstcnt = [SELECT ID,
                         firstname,lastname,phone,email
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
    
    public PageReference saveAll()
    {
        //Account Updation
        update this.acc;
        
        //Contact Deletion
        if(delContactList.size()>0)
        {
            Database.delete(delContactList , false);
        }
        
        //Contact Updation
        for(delContactWrapper f : lstwrap)
        {
           
                finalContactList.add(f.con);
          
        }
        
        for(Contact c: finalContactList)
        {
            if(string.isNotBlank(c.id))
           { 
            update c;
           }
           
           else
           {
               c.Accountid = acc.id;
               insert c;
           }
        }
       
        isError = true;
        Message = 'Records Updated Successfully';
        
        return null; 
    }
    
    public PageReference DeleteSelectedContact()
    {
        
        
        for(delContactWrapper d : lstwrap)
        {
            if(d.delCheck==true)
            {
                delContactList.add(d.con);
            }
            
            else
            {
                newContactList.add(d.con);
            }
             
            
        }
       
        if(delContactList.size()>0)
        {       
            lstwrap.clear();
        
            if(newContactList.size()>0)
            {
                for(Contact c: newContactList)
                {
                    lstwrap.add(new delContactWrapper(c,false));
                } 
            }
            
            
        }
        else
        {
            isError = true;
            Message = 'No Contact was Selected.';
        }    
            
        return null;   
         
    }
    
    public PageReference SaveNewContact()
    {
        emp_con = new Contact();
        lstwrap.add(new delContactWrapper(emp_con, false));
        isBlank = true;
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