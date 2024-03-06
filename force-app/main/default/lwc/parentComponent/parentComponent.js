import { LightningElement } from 'lwc';

export default class ParentComponent extends LightningElement {
startCount=0;

handleAddition(){
    this.startCount++;
}

handleSubstraction(){
    this.startCount--;
}

handleMultiplication(event){
    const multiValue=event.detail;
    console.log("Multi Value"+multiValue);
    this.startCount=this.startCount*multiValue;
}
}