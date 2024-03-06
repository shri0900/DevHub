import { LightningElement } from 'lwc';

export default class ParentComp extends LightningElement {

    value=0;

    handleChange(event){
        this.value=event.target.value;
    }

    handleAdd(){
        this.template.querySelector('c-child-comp').handleAddtion();
    }

    handleSub(){
        this.template.querySelector('c-child-comp').handleSubstraction();
    }

}