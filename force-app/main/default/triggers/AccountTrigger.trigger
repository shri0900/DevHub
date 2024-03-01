trigger AccountTrigger on Account (before insert,after insert,before update,after update,before delete,after delete,after undelete) {

if(Trigger.IsInsert){
if(Trigger.isBefore){
AccountTriggerHandler.updateRating(Trigger.new);
}
else if(Trigger.isAfter){
AccountTriggerHandler.createRelatedCons(Trigger.new);
AccountTriggerHandler.relatedOpps(Trigger.New);
}

if(Trigger.IsUpdate){
if(Trigger.IsBefore){

}
else if(Trigger.isAfter){
    AccountTriggerHandler.updateconPhone(Trigger.new, Trigger.oldMap);

}
}
}

}