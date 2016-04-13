public with sharing class AngularDemoController {
        
  
    //Subclass : Wrapper Class 
    public class Accountwrap {
        //Static Variables 
        public string id;
        public string name;
        public string Phone;
        public string Revenue ;
        
        //Wrapper  Class Controller
        Accountwrap() {
            Phone = '';
        }
        
    }
 
   
     public static String getlstAccount()
      {
        List <Accountwrap> lstwrap = new List < Accountwrap > ();
        List <Account> lstacc = [SELECT Id, Name, Phone, AnnualRevenue
                                   FROM Account
                                  ];
        for (Account a: lstacc ) 
        {
            Accountwrap awrap = new Accountwrap();
            awrap.id = a.id;
            awrap.name = a.name;
            awrap.Revenue = String.valueOf(a.AnnualRevenue);
            if (a.Phone != null) 
            {
                awrap.Phone = a.Phone;
            }
            lstwrap.add(awrap);
        }
        system.debug('Account JSON===========================>'+  JSON.serialize(lstwrap));
        return JSON.serialize(lstwrap);
     }
    
       
 }