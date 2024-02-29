public with sharing class AccountTriggerHandler {

public static void updateRating(List<Account>newAccList){
For(Account acc:newAccList){
    if(acc.Industry=='Media'){
        acc.Rating='Hot';
    }
}   
}

}