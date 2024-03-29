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

public static void updateconPhone(List<Account>accList,Map<Id,Account>oldAccMap){
Set<Id>accIds=New Set<Id>();
For(Account acc:accList){
    if(acc.Phone!=null&&acc.phone!=oldAccMap.get(acc.Id).Phone){
        accIds.add(acc.Id);
    }
}

Map<Id,Account>accMap=New Map<Id,Account>();

For(Account acc:[SELECT Id,Name,Phone FROM Account wHERE ID IN:accIDs]){
    accMap.put(acc.Id, acc);
}
List<Contact>conList=New List<Contact>();
For(Contact con:[SELECT Id,Phone,AccountID FROM Contact WHERE AccountID IN:accIds]){
    if(accMap.containsKey(con.accountId)){
        con.Phone=accMap.get(con.AccountId).Phone;
        conList.add(con);
    }
}

if(!conList.isEmpty()){
    system.debug(conList);
    insert conList;
}
}
//Scenario-Create task when a account is created with rating='Hot'
public static void createTask(List<Account>newAccList){
List<Task>tskList=New List<Task>();
For(Account acc:newAccList){
    if(acc.Rating=='Hot'){
        Task tsk=New Task();
        tsk.OwnerId=acc.OwnerId;
        tsk.WhatId=acc.Id;
        tsk.Status='Not Started';
        tsk.Subject='Account Rating Changed to'+acc.Rating;
        tsk.Priority='Normal';

        tskList.add(tsk);
    }
}

if(!tskList.isEmpty()){
    insert tskList;
}
}
//Scenario-When account rating is updated update description with acc rating

public static void updateDesc(List<Account>newAccList,Map<Id,Account>oldAccMap){
For(Account acc:newAccList){
    if(acc.rating!=oldAccMap.get(acc.Id).Rating){
        acc.Description=acc.Name+' Rating Updated '+'To '+acc.Rating;
    }
}
}

//Scenario-Avoid Deletion of Accounts With Industry='Media'
public static void avoidDeletion(List<Account>oldAccList){
    for(Account acc:oldAccList){
        if(acc.Industry=='Media'){
            acc.addError('Can not Delete Accounts With Industry Media');
        }
    }
}
public static void avoidDeletionIfIndustryIsBanking(List<Account>oldAccList){
    For(Account acc:oldAccList){
        if(acc.Industry=='Banking'){
            acc.addError('Fatal Error:Industry Banking:Can Not Delete');
        }
    }
}

}