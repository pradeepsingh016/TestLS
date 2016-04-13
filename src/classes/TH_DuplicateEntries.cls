public class TH_DuplicateEntries
{
    List<Candidate__c> canListOrg;
    List<Candidate__c> allCanList;
    List<Candidate__c> newCanList;
    Boolean flag;
   
    public TH_DuplicateEntries(List<Candidate__c> canList)
  {
      canListOrg = new List<Candidate__c>();
      newCanList= new List<Candidate__c>();
      allCanList = new List<Candidate__c>();
      canListOrg = canList;
      flag= false;
     
     
  }
  
  public void findDuplicate()
  {
      
     
      allCanList = [SELECT Last_Name__c,
                          Email__c
                          FROM Candidate__c];
      
     
      
      if(allCanList.size()>0)
      {
       for(Candidate__c c1: canListOrg)
       {
           for(Candidate__c c2: allCanList)
           {
               if((c1.Last_Name__c == c2.Last_Name__c ) && (c1.Email__c== c2.Email__c)) 
               {
                   flag= true;
                   break;
               }
           }     
     
        
          if(flag==true)
          {
               c1.Last_Name__c.adderror('Last Name Already exist');
               c1.Email__c.adderror('Email Already exist');
               break;
          }
          else
          {
              newCanList.add(c1);
          }
       }
     }  
  
      
      
    }
}