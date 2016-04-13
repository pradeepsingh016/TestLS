public class searchData
{
    public List<Position__c> posList{get;set;}
    public List<Job_Application__c> jobList{get;set;}
    public string searchContent{get;set;}
    public string posId{get;set;}
    public Boolean isBlank {get;set;}
    public Boolean showCandidates {get;set;}
    public Boolean isBlank2 {get;set;} 
    public List<Job_Application__c> cadList {get;set;}
    public List<Job_Application__c> cadListHired {get;set;}
    public List<Job_Application__c> cadListRejected {get;set;}
    
   
    
    public searchData()
    {
        posList = new List<Position__c>();
        
                isBlank = false;
                isBlank2 = false;
                showCandidates =false;
        
    }
    
    public PageReference searching()
    {
         if(string.isNotBlank(searchContent))
        {
            isBlank = false;
            String SelectString = 'SELECT ID, Name, Max_Pay__c, Min_Pay__c, Responsibilities__c From Position__c';
            String Filter = ' Where name like '+'\'%'+searchContent+'%\'';
            String DynamicUserFilter=SelectString+Filter;
            posList = Database.query(DynamicUserFilter);
        }
         else
        {
            isBlank = true;
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO,'Search is Empty'));
        } 
         
        
        return null;
    }
    
    public PageReference showCandidates()
    {
        jobList = new List<Job_Application__c>();
        cadList= new List<Job_Application__c>();
        cadListHired= new List<Job_Application__c>();
        cadListRejected= new List<Job_Application__c>();
        jobList = [SELECT 
                         Job_Application__c.Candidates__r.id,
                          Job_Application__c.Candidates__r.name,
                          Job_Application__c.Candidates__r.email__c,
                          Status__c
                          FROM Job_Application__c 
                          WHERE Positions__c =:posId];
     if(jobList.size()>0)
     {
        showCandidates = true;
        for(Job_Application__c j: jobList)
        {
            cadList.add(j);
            if(j.Status__c == 'Hired')
            {
                cadListHired.add(j);
            }
             if(j.Status__c == 'Rejected')
            {
                cadListRejected.add(j);
            }
            
            
        }

       
     }
     else
     {
          isBlank2 = true;
          ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO,'No Records Found'));
     }   
       
        
        
        
        return null;
    }
    
}