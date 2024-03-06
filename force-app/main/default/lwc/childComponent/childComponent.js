import { LightningElement } from 'lwc';

export default class ChildComponent extends LightningElement {

    handleAdd(){
        this.dispatchEvent(new CustomEvent('add'));
    }

    handleSub(){
        this.dispatchEvent(new CustomEvent('substract'));
    }

    handleMulti(event){
        const multiFactor=event.target.value;

        this.dispatchEvent(new CustomEvent('multiply',{
            detail:multiFactor
        }));
    }
}