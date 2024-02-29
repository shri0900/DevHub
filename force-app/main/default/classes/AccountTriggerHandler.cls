public with sharing class AccountTriggerHandler {

public static void updateRating(List<Account>newAccList){
For(Account acc:newAccList){
    if(acc.Industry=='Media'){
        acc.Rating='Hot';
    }
}   
}

public static void createRelatedCons(List<Account>newAccList){
    List<Contact>conListToInsert=New List<Contact>();

    For(Account acc:newAccList){
        Contact con=New Contact();
        con.LastName='Test From Trigger'+acc.Name;
        con.AccountId=acc.Id;
        conListToInsert.add(con);
    }

    if(!conListToInsert.isEmpty()){
        insert conListToInsert;
    }
}

}