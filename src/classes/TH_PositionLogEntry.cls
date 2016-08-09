public class TH_PositionLogEntry
{
    List<Position__c> posList;
    List<Position_History_Log__c> posHisList;
    Position_History_Log__c posHis;
    
    public TH_PositionLogEntry(List<Position__c> posLst)
    {
        posList = new List<Position__c>();
        posHisList= new List<Position_History_Log__c>();
        posList = posLst;
    }
    
    public void createLog()
    {
        for(Position__c p: posList)
        {
            posHis = new Position_History_Log__c ();
            posHis.Name = p.Name;
            posHis.Max_Pay__c = p.Max_Pay__c;
            posHis.Min_Pay__c = p.Min_Pay__c;
            posHis.Log_Creation_Date__c= DateTime.now();
            posHisList.add(posHis); 
            
        }
        
        if(!posHisList.isEmpty())
        {
            Database.insert(posHisList,false);
        }
        
    }
}