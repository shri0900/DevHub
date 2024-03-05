import { LightningElement } from 'lwc';
import { updateRecord } from 'lightning/uiRecordApi';
import ID_FIELd from '@salesforce/schema/Account.Id';
import NAME_FIELD from '@salesforce/schema/Account.Name';


export default class UpdateRecWithoutapex extends LightningElement {

    accName;
    accId;

    handleIdChange(event){
        this.accId=event.target.value;
    }

    handleNameChange(event){
        this.accName=event.target.value;
    }

    handleUpdate(){
        const fields={}
        fields[NAME_FIELD.fieldApiName]=this.accName;
        fields[ID_FIELd.fieldApiName]=this.accId;

        const recordInput={fields}

        updateRecord(recordInput)
        .then(result=>{
            console.log("Result"+JSON.stringify(result));
            window.alert('Acc Updated');
        })
        .catch(error=>{
            console.log("error"+JSON.stringify(error))
        })
    }
}