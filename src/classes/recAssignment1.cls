public class recAssignment1 
{
   
   public Position__c pos;
   public List<Job_Application__c> jobList{get;set;}
   public List<Job_Application__c> jobList2{get;set;}
   public string jobId{get;set;}
   public List<Candidate__c> canList{get;set;}
   public Set<ID> canUniId;
   public boolean displayPopup {get; set;}
   
   public recAssignment1(ApexPages.StandardController controller) 
    {
        //refreshPage = false;
        this.pos = (Position__c)controller.getrecord();    
        jobList = new List<Job_Application__c>();
        jobList2 = new List<Job_Application__c>();
        jobId = '';
        canUniId = new Set<ID>();
        jobList =  [SELECT ID,
                            Name,
                            Status__c
                           FROM Job_Application__c WHERE Positions__r.id = :pos.id];
        
    } 
    
    public PageReference showCandidates()
    {
        System.debug('JOb'+jobId);
        jobList2 =  [SELECT Candidates__r.id
                           FROM Job_Application__c WHERE Job_Application__c.id = :jobId];
                           
        System.debug('Job Application List 1'+jobList2 );                   
        for(Job_Application__c j : jobList2)
        {
            canUniId.add(j.Candidates__r.id);
        }
        System.debug('Candidate 1'+canUniId);
        canList = [SELECT ID,
                          NAME,
                          City__c,
                          Country__c
                          FROM Candidate__c
                          WHERE ID in : canUniId];
        System.debug('Candidate List'+canList);
        
        return null;
    }
    
     public void closePopup() {
        displayPopup = false;
       
    }
    
     public void showPopup() {
        displayPopup = true;
    }
    
}