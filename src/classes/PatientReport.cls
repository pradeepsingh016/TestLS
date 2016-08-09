public class PatientReport
{
    public string id{get;set;}
    public List<Test__c> lstTest{get;set;}
    public PatientReport()
    {
        lstTest = new List<Test__c>();
        id =  System.currentPagereference().getParameters().get('id');
        lstTest = [SELECT Patient_Name__c, name, Billing_Amount__c,Test_Number__c,Test_Date__c FROM Test__c WHERE Patient_Name__c = : id];
    }
}