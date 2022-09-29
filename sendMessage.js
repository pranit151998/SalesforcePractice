import { LightningElement,track } from 'lwc';
import sendWAMessage from '@salesforce/apex/WhatsappIntegrationController.sendWAMessage';
import SystemModstamp from '@salesforce/schema/Account.SystemModstamp';
export default class SendMessage extends LightningElement {

    @track message;
    
    sendMessage(){

        sendWAMessage({message:this.message}).then(result=>{
            console.log('Message Sent');
            console.log(this.message);
        })

    }

    onChangeHandler(event){
        console.log(event.target.name);
        if(event.target.name==='message'){
            this.message=event.target.value;
        }
    }

}