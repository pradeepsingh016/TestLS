public with sharing class BarcodeScan
{
     public string barCode{get;set;}
     
     public void ScanBarcode(){
 
     
       barCode=Apexpages.currentPage().getParameters().get('input1');
       List<Barcode__c> barCodeList= [Select id,Barcode_Value__c,Quantity__c FROM Barcode__c];
      if(barCode != null){
       for(Barcode__c b: barCodeList){
           if(b.Barcode_Value__c == barCode){
             if(b.Quantity__c !=null){
               b.Quantity__c = b.Quantity__c + 1;
               }
               else{
                   b.Quantity__c  = 1;
               }
           }
       } 
       update barCodeList; 
      }
      
     }
     
}