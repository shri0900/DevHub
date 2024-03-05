import { LightningElement,wire,track } from 'lwc';
import getAccs from '@salesforce/apex/AccountHelper.getAccs';

const columns=[
    {label:'Account Name',fieldName:'Name'},
    {label:'Account Id',fieldName:'Id'}
];
export default class DataTable extends LightningElement {
    columns=columns;
  @track  data=[];

    @wire(getAccs)
    wiredAccs({data,error}){
        if(data){
            this.data=data;
        }
        else if(error){
            console.log("Error "+JSON.stringify(error));
        }
    }

}