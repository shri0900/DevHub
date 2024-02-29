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

    public static void relatedOpps(List<Account>newAccList){
        List<Opportunity>oppToInsert=New List<Opportunity>();

        For(Account acc:newAccList){
            Opportunity opp=New Opportunity();
            opp.Name='Test opp';
            opp.StageName='Prospecting';
            opp.CloseDate=system.today()+10;
            opp.AccountId=acc.Id;
            oppToInsert.add(opp);
        }

        if(oppToInsert.isEmpty()){
          insert  oppToInsert;
        }
    }
}