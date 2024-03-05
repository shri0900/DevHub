import { LightningElement } from 'lwc';
import createAcc from '@salesforce/apex/AccountHelper.createAcc';

export default class CreateRecWithApex extends LightningElement {
    accountName;
    accountRating;
    accId;

    handleAccName(event){
        this.accountName=event.target.value;
    }

    handleRatingChange(event){
        this.accountRating=event.target.value;
    }

    handleClick(){
        createAcc({accName:this.accountName,accRating:this.accountRating})
        .then(result=>{
            console.log("Result"+JSON.stringify(result));
            this.accId=result[0].Id;
        })
        .catch(error=>{
            console.log("Error"+JSON.stringify(error));
        })
    }

}