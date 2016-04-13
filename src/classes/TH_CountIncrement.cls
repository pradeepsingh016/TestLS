public class TH_CountIncrement
{
  List<Account> lstAcc;
  List<Contact> lstCtc;
  List<Contact> lstCtcNew;
  Set<ID> sId;
  public TH_CountIncrement(List<Account> accLst)
  {
     lstAcc = new List<Account>();
     lstCtc = new List<Contact>();
     lstCtcNew = new List<Contact>();
     sId = new Set<ID>();
     lstAcc = accLst;
  }
  
  public void UpdateCount()
  {
      for(Account acc:lstAcc)
      {
        sId.add(acc.ID);
      }

  
  lstCtc = [SELECT ID,
                   COUNT__c
              FROM CONTACT 
              WHERE Accountid IN :sId];
              
    system.debug('List size is '+lstCtc .size());
              
    if(!lstCtc.isEmpty())
      {
      for(Contact con :lstCtc)
      {
          //con.count__c = con.count__c+1;
          
          system.debug('Value of contact is'+con.COUNT__c);
          if(con.Count__c!=null)
          {
              system.debug('Enter here1');
              con.Count__c = con.Count__c + 1;

          }
          else
          {
              con.Count__c = 1;
          }
          
          lstCtcNew.add(con);
      }
    
    }
     
      if (!lstCtcNew.isEmpty())
    {
        database.update(lstCtcNew, false);
    }
  
  }  
  
  
}