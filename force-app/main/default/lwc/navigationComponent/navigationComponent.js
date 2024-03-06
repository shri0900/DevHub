import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';

export default class NavigationComponent extends NavigationMixin(LightningElement) {

    handleNatoAcc() {
        this[NavigationMixin.Navigate]({
            type:"standard__objectPage",
            attributes: {
                objectApiName: "Account",
                actionName: "home"
            }
        });
    }

    handleNavToRec(){
        this[NavigationMixin.Navigate]({
            type:"standard__recordPage",
            attributes:{
                recordId:'001H4000004acgFIAQ',
                actionName:'edit'
            }
        });
    }

    handleToWeb(){
        this[NavigationMixin.Navigate]({
            type:"standard__webPage",
            attributes:{
                url:'https://www.youtube.com/playlist?list=PLu0W_9lII9agS67Uits0UnJyrYiXhDS6q'
            }
        });
    }
}
