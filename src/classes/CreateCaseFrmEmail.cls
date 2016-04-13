global class CreateCaseFrmEmail implements Messaging.InboundEmailHandler {
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email,
    Messaging.InboundEnvelope envelope) {
 
        Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();
        
 // Create Case From Email

try{

    Case c = new Case();
    c.Status = 'New';
    c.Origin = 'Email';
    c.Subject = email.subject;
    c.Description = email.plainTextBody;
    
    insert c;
    
      Attachment attachment = new Attachment();
      attachment.Name = email.fromAddress;
      attachment.Body = Blob.valueOf(email.plainTextBody);
      attachment.ParentId = c.Id;
      insert attachment;
    
    result.success = true;
}
    catch (Exception e) {
          result.success = false;
          result.message = 'Oops, I failed.';
        }
    
return result;

    }
 }