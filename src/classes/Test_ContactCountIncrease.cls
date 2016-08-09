@isTest
public class Test_ContactCountIncrease
{
    static Account acc;
    static Contact con;
    static Contact conNew;
    
    public static void initialize()
    {
        acc = new Account();
        acc.Name = 'TestAccount';
        acc.SLASerialNumber__c = '123';
        
        insert acc;
        
        con = new Contact();
        con.accountid = acc.id;
        con.LastName = 'TestName';
         
        insert con;
                
        
    }
    
    public static testMethod void test_positive()
    {
        initialize();
        test.starttest();
        acc.Name = 'TestAccount';
        acc.SLASerialNumber__c = '1234';
        
        update acc;
        conNew = new Contact();
        conNew = [SELECT ID,
                         COUNT__c
                    FROM CONTACT 
                    WHERE ID =: con.id];
        system.assertEquals(conNew.Count__c,1);
        test.stoptest();
    }
 
 }