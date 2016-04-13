@isTest
public class Test_accountContactCountIncrease
{
    static Account acc;
    static Contact con;
    
    public static void initialize()
    {
        acc = new Account();
        acc.Name = 'TestAccount';
        acc.SLASerialNumber__c = '12';
        
        insert acc;
        
        con = new Contact();
        con.id = acc.id;
        con.LastName = 'TestName';
         
        insert con;        
        
    }
}