public with sharing class AutoCompleteController {
    
    // Instance fields
    public String searchTerm {get; set;}
    public String selectedAccount {get; set;}
    
    // Constructor
    public AutoCompleteController() {
        
    }
    
    // JS Remoting action called when searching for a account name
    @RemoteAction
    public static List<Account> searchAccount(String searchTerm) {
        System.debug('Account Name is: '+searchTerm );
        List<Account> Account= Database.query('Select Id, Name from Account where name like \'%' + String.escapeSingleQuotes(searchTerm) + '%\'');
        return Account;
    }
    
}