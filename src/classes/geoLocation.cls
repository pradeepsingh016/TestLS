/*

Class Name: assignment 11
Purpose: To show longitude and latitude using JSON Parser
Created By: Pradeep Singh
Created Date: 1/12/2015 (mm/dd/yyyy)

Change History:
-----------------------------------------------------------------------------------------------------------
Modification Reason                                Modified By                    Modified Date
-----------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------

*/


public class geoLocation
{
     public string city{get;set;} // Variable to store city name
     public string state{get;set;} // Variable to store state name
     public string htmlText{get;set;} // Variable to response name
     public string lng{get;set;} // Variable to store longitude name
     public string lat{get;set;} // Variable to store latitude name
     
     public void getGeoLocation() // Function is used to send response to google API and get Response in XML Format
     {
         Http http = new Http();
         HttpRequest req = new HttpRequest();
         
         String endPointUrl='https://maps.googleapis.com/maps/api/geocode/json?address='+city+','+state+'&sensor=false';
         req.setEndpoint(endPointUrl);
         req.setMethod('GET');
         
         HttpResponse res = http.send(req);
         htmlText = '';
         lng='';
         lat='';
         try
         {
             htmlText = res.getBody();
             JSONParser parser = JSON.createParser(res.getBody());
             while(parser.nextToken()!=null)
             {
                 if(parser.getCurrentToken()== JSONToken.FIELD_NAME && parser.getText()== 'location')
                 {
                     parser.nextToken();
                     parser.nextToken();
                     parser.nextToken();
                     lat = parser.getText();
                     parser.nextToken();
                     parser.nextToken();
                     lng=parser.getText();
                 }
             } 
         }
         
         Catch(Exception e){}
     }  
    
}