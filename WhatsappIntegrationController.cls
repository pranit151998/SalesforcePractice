public class WhatsappIntegrationController {
    
    @AuraEnabled
    public static void sendWAMessage( String message){
        //String contactNumber='918408053328';
        requestController(message);
        
    }
    public static void requestController(String messageBody){
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://graph.facebook.com/v14.0/104439995774020/messages');
        req.setHeader('Content-Type', 'application/json');
        req.setMethod('POST');
        
        String apiKey='EAAJGyuiomO0BAOuqMSMICxL9PiHZB7waupXCJDBL37Q4hrZBLqa5mLApeYSjoGMcazQn9eF2QrrJHKs8LiAZBlNTaK3fJrIjExz3YATovMni08ZAwWn8IpZAnA7ZAPTVA5IOsSMZAkxmdAeDGTlP3ch4oe6AiBJApEACaRZCTUW11WMbF51DcHrQpJjvbswJ0UMVZCJWjxZAFTBkNvQ8mPCV6w';
        String body='{"messaging_product":"whatsapp","to":"918408053328","text":{"body":"'+messageBody+'"}}';
        
        req.setHeader('Authorization', 'Bearer '+apiKey);
        req.setBody(body);
        HttpResponse response= new HttpResponse();
        response=h.send(req);
        system.debug('response>>'+response);
        system.debug('response>>'+response.getBody());
    }

}
