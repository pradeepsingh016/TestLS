public class AssignAvatar{

    public List<Document> Docs{get;set;}
    public List<Document> DocsWrapSelected{get;set;}
    public List<Folder>Fid {get;set;}
    public SET<ID>NewFid {get;set;}
    public List<SelectImageWrapper> DocsWrap{get;set;}
    public string AvatarId{get;set;}
    public string ContactId{get;set;}
    public Boolean isBlank {get;set;}
    public Contact cont{get;set;}
    public string URL{get;set;}
    public string UrlId{get;set;}
    public string SelectString{get;set;}
    public Blob NewImage{get;set;}
    public string ImageName{get;set;}
    public List<Folder>folist{get;set;}
    public Set<ID>Fid_New{get;set;}
    
    //Class Contructor
    public AssignAvatar(ApexPages.StandardController controller) {

        Docs = new List<Document>(); 
        DocsWrapSelected = new List<Document>();
        folist = new List<Folder>(); 
        Fid = new List<Folder>();
        NewFid = new SET<ID>();
        DocsWrap = new List<SelectImageWrapper>();
        isBlank = false;
        ImageName ='';
        
        ContactId = System.currentPagereference().getParameters().get('id');
        
        Fid = [SELECT ID From Folder Where Name Like 'Avatars'];
        for(Folder f : Fid)
        {
            NewFid.add(f.id);
        }
        System.debug('Folderid===========>'+ NewFid);
        
        Docs = [SELECT ID,
                       Url,
                       NAME
                       From Document Where FolderID in : NewFid];
        
        for(Document d:Docs)
           {
               DocsWrap.add(new selectImageWrapper(d,false));
           }
        
        System.debug('Documents===========>'+ Docs);
        
    }
    
    
    
    // Function to update or insert a new Avatar
    public PageReference SaveAvatar()
    {
        system.debug('Radio0TRTR'+AvatarId);
        
        /*for(selectImageWrapper w : DocsWrap)
        {
            if(w.radio == true)
            {
                DocsWrapSelected.add(w.doc);
                SelectString = 'https://c.ap1.content.force.com/servlet/servlet.FileDownload?file=';
                UrlId =w.doc.id;
                URL = SelectString + UrlId;
            } 
        }*/
        
         if(string.isBlank(AvatarId))
        {
            isBlank = true;
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO,'No Avatar Selected'));
        }
        else
        {
              try {
                     cont = [SELECT Photo__c FROM Contact WHERE ID = : ContactId];
                     SelectString = 'https://c.ap1.content.force.com/servlet/servlet.FileDownload?file=';
                     UrlId = AvatarId;
                     URL = SelectString + UrlId;
                     cont.Photo__c = URL;
   
                    // Make the update call.
                    update cont;
                    PageReference ref = new PageReference('https://ap1.salesforce.com/'+ContactId);
                    return ref;
                    
                }
                 catch(DmlException e) {
                 System.debug('An unexpected error has occurred: ' + e.getMessage());
                }
        }
        
       return null;
        
      
        
      }
    
    public PageReference redirectUser(){
    
    PageReference ref = new PageReference('https://ap1.salesforce.com/'+ContactId);
    
    return ref;
    } 
    
    public PageReference  SaveNewImage()
    {
             if(string.isBlank(ImageName))
        {
            isBlank = true;
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO,'No Image Selected'));
        }
        else
        {
        try {
                folist.clear();
                folist= [SELECT ID From Folder Where Name Like 'Avatars'];
                
                Document doc = new Document(
                    Name=ImageName,
                    Body=NewImage,
                    FolderId=folist.get(0).id);
                insert doc;
            } catch(DmlException e) {
                System.debug('An unexpected error has occurred: ' + e.getMessage());
            }      
        }
       PageReference ref = new PageReference('https://c.ap1.visual.force.com/apex/BootstrapPage?scontrolCaching=1&id='+ContactId);
       return ref;
        
        
    }
    
    //Wrapper Class which contain Document object and radio Value
    public class selectImageWrapper
    {
        public Document doc{get;set;}
        public Boolean radio{get;set;}
        
        public selectImageWrapper( Document d, Boolean r)
        {
            doc = d;
            radio = r;
            
            
        }
    }

}