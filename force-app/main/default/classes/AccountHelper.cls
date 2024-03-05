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

    @AuraEnabled
    public static List<Account> createAcc(String accName,String accRating){
       List<Account>accListtoInsert=New List<Account>();
        try {
            Account acc=New Account();
            acc.Name=accName;
            acc.Rating=accRating;
            accListtoInsert.add(acc);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }

        if(!accListtoInsert.isEmpty()){
            insert accListtoInsert;
        }

        return accListtoInsert;
    }

    @AuraEnabled
    public static List<Account> updateAcc(String accId,String accName,String accRating){
        List<Account>accList=[SELECT Id,Name,Rating FROM Account WHERE Id=:accId LIMIT 1];
        List<Account>updatedAccList=New List<Account>();
        try {
            For(Account acc:accList){
                acc.Name=accName;
                acc.Rating=accRating;
                updatedAccList.add(acc);
            }
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }

        if(!updatedAccList.isEmpty()){
            update    updatedAccList;
        }

        return updatedAccList;
    }
}