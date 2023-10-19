public with sharing class PopulateLongitudeLattitudeAssSeven {


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
         req.setEndpoint('https://maps.googleapis.com/maps/api/geocode/json?KEY='+myGoogleProjectKey+'&address=' + CityTextId + ',' + StateTextId+'&sensor=false');
//         req.setEndpoint('https://maps.googleapis.com/maps/api/geocode/json?address=' + CityTextId + ',' + StateTextId);
         CalledURL = req.getEndpoint();
         req.setMethod('GET');
         
         // Create a new http object to send the request object
         // A response object is generated as a result of the request  
         Http http = new Http();
         HTTPResponse res = http.send(req);
         HttpResponse = res.getBody();
         
         System.debug('request URL : ' + req);
         System.debug('response body : ' + HttpResponse);
         
        JSONParser parser = JSON.createParser(res.getBody());
        Double latitude = null;
        Double longitude = null;

        /* 
           "location" : {
           "lat" : 37.42291810,
           "lng" : -122.08542120
          } 
        */
        while (parser.nextToken() != null)
        {
            if ((parser.getCurrentToken() == JSONToken.FIELD_NAME)
                && (parser.getText() == 'location'))
                {
                    // Jump to latitude and longtitude fields.
                    parser.nextToken();

                    while (parser.nextToken() != JSONToken.END_OBJECT)
                    {
                        String text = parser.getText();
                        parser.nextToken();
                        if (text == 'lat') latitude = parser.getDoubleValue();
                        else if (text == 'lng') longitude = parser.getDoubleValue();
                    }
                } 
        }

        // Update Account coordinates.
        if (latitude != null)
        {
            LatitudeText = latitude+'';
        }
        else
        {
            LatitudeText = 'NA';
        }
        // Update Account coordinates.
        if (longitude != null)
        {
            LongitudeText = longitude+'';
        }
        else
        {
            LongitudeText = 'NA';
        }

    
         return null;
    }
}