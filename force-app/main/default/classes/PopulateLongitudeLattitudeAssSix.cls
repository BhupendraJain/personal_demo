public with sharing class PopulateLongitudeLattitudeAssSix {


    public String CalledURL{get; set;}
    public String CityTextId{get; set;}
    public String StateTextId{get; set;}
    public String HttpResponse{get; set;}
    public String LatitudeText{get; set;}
    public String LongitudeText{get; set;}
    private String myGoogleProjectKey = 'AIzaSyCrp69P9YP8oeS4_Aa5Dkq4TnObT5fOUKE';

    public PageReference PopulateLatituteLongitude() {
    
        if(CityTextId== null || CityTextId.trim().length() == 0)
        {
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Please enter City Name'));
            return null;
        }
        
        if(StateTextId== null || StateTextId.trim().length() == 0)
        {
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Please enter State Name'));
            return null;
        }
        
     HttpRequest req = new HttpRequest();
     req.setEndpoint('https://maps.googleapis.com/maps/api/geocode/xml?KEY='+myGoogleProjectKey+'&address=' + CityTextId + ',' + StateTextId+'&sensor=false');
//     req.setEndpoint('https://maps.googleapis.com/maps/api/geocode/xml?address=' + CityTextId + ',' + StateTextId');
     CalledURL = req.getEndpoint();
     req.setMethod('GET');
     
     // Create a new http object to send the request object
     // A response object is generated as a result of the request  
     Http http = new Http();
     HTTPResponse res = http.send(req);
     HttpResponse = res.getBody();
     
     System.debug('request URL : ' + req);
     System.debug('response body : ' + HttpResponse);
     
     Dom.Document doc = res.getBodyDocument();
     //Retrieve the root element for this document.
     Dom.XMLNode address = doc.getRootElement();
     
     
     Dom.XmlNode[] childResultNodes;
     LatitudeText=null;
     LongitudeText=null;
     for(Dom.XmlNode node : address.getChildElements()) {
         if(node.getName()=='result') {
             childResultNodes = node.getChildren();
             for(Dom.XmlNode geometryNode : childResultNodes){
                if(geometryNode.getName()=='geometry')
                {
                     childResultNodes = geometryNode.getChildren();
                     for(Dom.XmlNode locationNode : childResultNodes){
                         if(locationNode.getName()=='location')
                         {
                             childResultNodes = locationNode.getChildren();
                             for(Dom.XmlNode latLongNode : childResultNodes){
                                 if(latLongNode.getName()=='lat')
                                 {
                                     LatitudeText = latLongNode.getText();
                                     System.debug('Finally GOT-Latitude Text: locationNode.getText() ' + latLongNode.getName() + ' :: ' + latLongNode.getChildren());
                                 }
                                 if(latLongNode.getName()=='lng')
                                 {
                                     LongitudeText = latLongNode.getText();
                                     System.debug('Finally GOT-Longitude: locationNode.getText() ' + latLongNode.getName() + ' :: ' + latLongNode.getChildren());
                                 }
                            }
                         }
                    }
                }
             }
         }
     }
     
     if(LatitudeText==null||LatitudeText.trim().length()==0)
     {
         LatitudeText='NA';
     }
     if(LongitudeText==null||LongitudeText.trim().length()==0)
     {
         LongitudeText='NA';
     }

     System.debug('LatitudeText: '+LatitudeText);
     System.debug('LongitudeText: '+LongitudeText);

     return null;
    }

}