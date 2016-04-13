/*

Class Name: assignment 8
Purpose: To show list of accounts and their contacts by using single soql query
Created By: Pradeep Singh
Created Date: 1/9/2015 (mm/dd/yyyy)

Change History:
-----------------------------------------------------------------------------------------------------------
Modification Reason                                Modified By                    Modified Date
-----------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------

*/

public class assignment8
{
   public List<Account> listAcc{get;set;}
    
    public assignment8()
    {
        listAcc = new List<Account>();
        listAcc = [SELECT Account.Id, Account.Name,
                          (SELECT Contact.FirstName, Contact.LastName, Contact.Phone, Contact.Email FROM Account.Contacts)
                          FROM Account];
        
    }
}