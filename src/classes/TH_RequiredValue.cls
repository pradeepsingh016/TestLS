public class TH_RequiredValue
{
  List<Position__c> lstPos;
  
  public TH_RequiredValue(List<Position__c> posLst)
  {
       lstPos = new List<Position__c>();
       lstPos= posLst;
       
  }
  
  public void RequiredResponsibilities()
  {
 
    for(Position__c pos:lstPos)
    {
      if(string.isBlank(pos.Responsibilities__c))
       {
           pos.adderror('Responsibilities Cannot be left blank');
           system.debug('Responsibilities Cannot be left blank');
       }
     }
  }
  
}