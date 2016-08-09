Public class newTest
{
    public Test__c newTest {get;set;}
   List<Test__c > lstTest;
    public newTest() {
        newTest = new Test__c ();
        lstTest= new List<Test__c >();
    }

    public PageReference saveRecord()
    {
       lstTest.add(newTest );
       insert lstTest;
        PageReference ref = new PageReference('https://c.ap1.visual.force.com/apex/Laboratory_Tests?save_new=1&sfdc.override=1');
        return ref;
    }
}