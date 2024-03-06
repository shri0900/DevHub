import { LightningElement, api } from 'lwc';

export default class ChildComp extends LightningElement {
    @api
    startvalue=0;

    @api
    handleAddtion(){
        this.startvalue++;
    }

    @api
    handleSubstraction(){
        this.startvalue--;
    }
}