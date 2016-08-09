public class TH_OnePrimary
{
 List<Contact> lstcot;
 List<Contact> rescot;
 Set<ID> sId;
 Contact coterr;
 
     public TH_OnePrimary(List<Contact> cotlst)
     {
         lstcot = new List<Contact>();
         rescot = new List<Contact>();
         sId = new Set<ID>();
         lstcot = cotlst;
         coterr = new Contact();   
         
     }
     
      public void PrimaryCount()
  {
      for(Contact cot:lstcot)
      {
        sId.add(cot.Accountid);
      }
      
      system.debug('Sid'+ sId);
      
      rescot = [SELECT ID
              FROM CONTACT 
              WHERE Accountid IN :sId and Primary_Contact__c = true];
       
       if(rescot.size()>0)
       {
            
            coterr.adderror('Primary Contact for this Account already Exist');
       }
       else
       {
           database.update(rescot, false);
       }
   
   }   

}