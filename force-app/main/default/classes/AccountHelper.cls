public with sharing class AccountHelper {
  
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccs(){
      List<Account>accList=New List<Account>();
        try {
            accList=[SELECT Id,Name FROM Account LIMIT 10];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }

        return accList;
    }
}