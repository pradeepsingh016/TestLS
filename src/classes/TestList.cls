public class TestList
{
   
     public List<Test__c> lstTest{get;set;}
     Test__c todel;
     public string delTestId{get;set;} 
     public TestList() {
        lstTest= new List<Test__c>();
       
        lstTest= [SELECT Patient_Name__c,
                         Test_Date__c,
                         Test_Name__c,
                         Test_Number__c,
                         Report_Status__c,
                        Billing_Amount__c 
                         FROM Test__c];
        todel =new Test__c();
                         
    }

       public PageReference redirectUser(){
    PageReference ref = new PageReference('https://c.ap1.visual.force.com/apex/Test_New');
    return ref;
    } 
    
   public PageReference delTest()
    {
        
        todel = [SELECT Patient_Name__c,
                         Test_Date__c,
                         Test_Name__c,
                         Test_Number__c,
                         Report_Status__c,
                        Billing_Amount__c 
                         FROM Test__c WHERE id = : delTestid];
        
         
         delete todel;
         todel = new Test__c();
         lstTest= [SELECT Patient_Name__c,
                         Test_Date__c,
                         Test_Name__c,
                         Test_Number__c,
                         Report_Status__c,
                        Billing_Amount__c 
                         FROM Test__c];
         return null;
    }
    
    
    

}