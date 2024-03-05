import { LightningElement } from 'lwc';
import getAccs from '@salesforce/apex/AccountHelper.getAccs';

export default class SeachBox extends LightningElement {

value='';
optionsArr=[]

get options(){
return this.optionsArr;
}

connectedCallback(){
getAccs()
.then(result=>{
    let arr=[];

    for(var i=0;i<result.length;i++){
        arr.push({label:result[i].Name,value:result[i].Id});
    }
    this.optionsArr=arr;
})
}

handleAccChange(event){
this.value=event.target.value;
}
}