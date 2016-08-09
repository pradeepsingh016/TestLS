public class PatientList
{
     public List<Patient__c> lstpat{get;set;}
     Patient__c todel;
     public string delPatId{get;set;} 
     public string ReportId{get;set;}
     public PatientList() {
        lstpat = new List<Patient__c>();
        todel = new Patient__c();
        lstpat = [SELECT name,
                         Address__c,
                         Age__c,
                         Email_Id__c,
                         Gender__c,
                         Phone__c 
                         FROM Patient__c];
                         
    }

       
    
    public PageReference redirectUser(){
    PageReference ref = new PageReference('https://c.ap1.visual.force.com/apex/Patient_New');
    return ref;
    }
    
    public PageReference delPatient()
    {
        
        todel = [SELECT name,
                         Address__c,
                         Age__c,
                         Email_Id__c,
                         Gender__c,
                         Phone__c 
                         FROM Patient__c WHERE Id =: delPatId];
        
         
         delete todel;
         todel = new Patient__c();
         lstpat = [SELECT name,
                         Address__c,
                         Age__c,
                         Email_Id__c,
                         Gender__c,
                         Phone__c 
                         FROM Patient__c];
         return null;
    }
    
    public PageReference GenerateReport()
    {
       
        //PageReference ref = new PageReference('https://c.ap1.visual.force.com/apex/Patient_Report');
        //ref.getParameters().put('id',string.valueof(ReportId));
        //return ref;
        system.debug('ID IS HERE ------------------------>'+ ReportId);
        PageReference ref = new PageReference('/apex/Patient_Report?');
        ref.getParameters().put('id', ReportId);
        ref.setRedirect(true);
        return ref;
    }
    
}