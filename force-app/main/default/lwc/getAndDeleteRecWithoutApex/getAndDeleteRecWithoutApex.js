import { LightningElement,wire} from 'lwc';
import { getRecord,deleteRecord } from 'lightning/uiRecordApi';
import ID_FIELD from '@salesforce/schema/Account.Id';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import Id from '@salesforce/schema/Account.Id';

const FIELDS=[ID_FIELD,NAME_FIELD];
export default class GetAndDeleteRecWithoutApex extends LightningElement {

    accId;
    accName;
    accDetails;

    @wire(getRecord,({recordId:'001H4000004ajRWIAY',fields:FIELDS}))
    wiredAcc({data,error}){
        if(data){
            this.accDetails=data;
            this.accName=this.accDetails.fields.Name.value;
            this.accId=this.accDetails.id;
        }
        else if(error){
            console.log("Error"+JSON.stringify(error));
        }
    }

    handleDelete(){
        deleteRecord(this.accId)
        .then(result=>{
            window.alert('Acc Deleted');
        })
        .catch(error=>{
            console.log("error"+JSON.stringify(error))
        })
    }

}