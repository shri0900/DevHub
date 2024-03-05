import { LightningElement } from 'lwc';
import updateAcc from '@salesforce/apex/AccountHelper.updateAcc';

export default class UpdateRecWithApex extends LightningElement {

    accountId;
    accountName;
    accountRating;

    handleIdChange(event){
        this.accountId=event.target.value;
    }

    handleNameChange(event){
        this.accountName=event.target.value;
    }

    handleRatChange(event){
        this.accountRating=event.target.value;
    }

    handleUpdate(){
        updateAcc({accId:this.accountId,accName:this.accountName,accRating:this.accountRating})

        .then(result=>{
            console.log("result"+JSON.stringify(result));
        })
        .catch(error=>{
            console.log("Error"+JSON.stringify(error));
        })
    }
}