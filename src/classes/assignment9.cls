/*

Class Name: assignment 8
Purpose: To show account name in Page Message when Account name is clicked
Created By: Pradeep Singh
Created Date: 1/9/2015 (mm/dd/yyyy)

Change History:
-----------------------------------------------------------------------------------------------------------
Modification Reason                                Modified By                    Modified Date
-----------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------

*/


public class assignment9
{
   public List<Account> listAcc{get;set;} // Variable contain List of all Account
   public string Message{get;set;}// Variable contain the message to display
    
    public assignment9()//Contructor of the class
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