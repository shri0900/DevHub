import { LightningElement } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import RATING_FIELD from '@salesforce/schema/Account.Rating';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class CreateRecWithoutApex extends LightningElement {
    accName;
    accRating;
    accId;

    handleNameChange(event){
        this.accName=event.target.value;
    }



    handleRatingchange(event){
        this.accRating=event.target.value;
    }

    handleClick(){
        const fields={}
        fields[NAME_FIELD.fieldApiName]=this.accName;
        fields[RATING_FIELD.fieldApiName]=this.accRating;

        const recordInput=({apiName:ACCOUNT_OBJECT.objectApiName,fields});

        createRecord(recordInput)
        .then(result=>{
            console.log("Result"+JSON.stringify(result));
            this.accId=result.id;
            const evt=new ShowToastEvent({
                message:'New Account Created',
                title:'Congratulations',
                variant:'success'
            });

            this.dispatchEvent(evt);
        })
        .catch(error=>{
            console.log("Error"+JSON.stringify(error));
        })
    }

}