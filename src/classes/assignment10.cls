/*

Class Name: assignment 8
Purpose: To show selected accound in apexmessage block
Created By: Pradeep Singh
Created Date: 1/12/2015 (mm/dd/yyyy)

Change History:
-----------------------------------------------------------------------------------------------------------
Modification Reason                                Modified By                    Modified Date
-----------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------

*/

public class assignment10
{
    
    public List<Account> listAcc{get;set;}
   public string Message{get;set;}
   public string accountname{get;set;}
    
    public assignment10()
    {
        listAcc = new List<Account>();
        Message = 'Select an account by clicking on its name';
        listAcc = [SELECT id,
                          name,
                          billingstate,
                          phone,
                          website FROM Account];
    }
    
}