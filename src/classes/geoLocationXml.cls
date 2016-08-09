/*

Class Name: assignment 12
Purpose: To show longitude and latitude using XML Dom
Created By: Pradeep Singh
Created Date: 1/12/2015 (mm/dd/yyyy)

Change History:
-----------------------------------------------------------------------------------------------------------
Modification Reason                                Modified By                    Modified Date
-----------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------

*/
public class geoLocationXml
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
         
         String endPointUrl='https://maps.googleapis.com/maps/api/geocode/xml?address='+city+','+state+'&sensor=false';
         req.setEndpoint(endPointUrl);
         req.setMethod('GET');
         
         HttpResponse res = http.send(req);
         htmlText = '';
         lng='';
         lat='';
        
        dom.Document doc = res.getBodyDocument();
        htmlText = doc.toXmlString();
        
        dom.XmlNode location = doc.getRootElement().getChildElement('result',null).getChildElement('geometry',null).getChildElement('location',null);         

        lng = location.getChildElement('lng', null).getText();
        lat = location.getChildElement('lat', null).getText();

      
          
         
         
        
     }  
    
     
}