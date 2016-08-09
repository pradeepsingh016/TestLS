public class MyHelloWorld
{
     public static void applyDiscount(Position__c[] pos)
     {
         for (Position__c p :pos)
         {
              p.Min_Pay__c*=0.9; 
         }
     }
}