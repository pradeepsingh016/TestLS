public class TH_UpdateJobApplication{

    List<Offer__c> ofrList;
    Set<ID> jobId;
    List<Job_Application__c> jobList;
    List<Job_Application__c> newJobList;
   
    
    public TH_UpdateJobApplication(List<Offer__c> ofrLst)
    {
        ofrList = new List<Offer__c>();
        jobList = new List<Job_application__c>();
        newJobList = new List<Job_application__c>();
        ofrList = ofrLst;
        
        jobId = new Set<ID>();
    }
    
    public void updateJobApplication()
    {
       
      
        for(Offer__c o:ofrList)
        
        {
            jobId.add(o.Job_Application_Name__c);
        }
        
        jobList = [SELECT ID,
                          Status__c FROM
                          Job_Application__c Where Id in : jobId];
                          
         
        
        for(Offer__c o:ofrList)
        {
         for(Job_Application__c j:jobList)
          
        
           {
             
               if(o.Status__c != j.Status__c)
               {
                  
                  System.debug('Hi');
                   j.Status__c = o.Status__c;
                   newJobList.add(j);
                   break;
               }
           }
           if(!newJobList.isEmpty())
           {
               Database.update(newJobList,false);
           }
        }
        
        
    }
}