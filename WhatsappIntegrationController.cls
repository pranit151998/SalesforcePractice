public class SalesforceToWhatsappIntegrationController {
    
    @AuraEnabled
    public static void sendWAMessage( String message){
        //String contactNumber='918408058879;
        requestController(message);
        
    }
    public static void requestController(String messageBody){
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://graph.facebook.com/v14.0/104439995774020/messages');
        req.setHeader('Content-Type', 'application/json');
        req.setMethod('POST');
        
        String apiKey='meta api key put here';
        String body='{"messaging_product":"whatsapp","to":"918408058879","text":{"body":"'+messageBody+'"}}';
        
        req.setHeader('Authorization', 'Bearer '+apiKey);
        req.setBody(body);
        HttpResponse response= new HttpResponse();
        response=h.send(req);
        system.debug('response>>'+response);
        system.debug('response>>'+response.getBody());
    }

}
