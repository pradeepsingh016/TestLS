public class PatientNew
{

   public Patient__c newpat {get;set;}
   List<Patient__c > lstpat;
    public PatientNew() {
        newpat = new Patient__c();
        lstpat = new List<Patient__c >();
    }

    public PageReference saveRecord()
    {
       lstpat.add(newpat);
       insert lstpat ;
        PageReference ref = new PageReference('https://c.ap1.visual.force.com/apex/Patient?save_new=1&sfdc.override=1');
        return ref;
    }
    
  

}