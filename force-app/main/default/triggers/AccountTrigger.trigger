trigger AccountTrigger on Account (before insert,after insert,before update,after update,before delete,after delete,after undelete) {

if(Trigger.IsInsert){
if(Trigger.isBefore){
AccountTriggerHandler.updateRating(Trigger.new);
}
else if(Trigger.isAfter){
AccountTriggerHandler.createRelatedCons(Trigger.new);
AccountTriggerHandler.relatedOpps(Trigger.New);
AccountTriggerHandler.createTask(Trigger.new);
}
}
if(Trigger.IsUpdate){
if(Trigger.IsBefore){
AccountTriggerHandler.updateDesc(Trigger.new,Trigger.oldMap);
}
else if(Trigger.isAfter){
AccountTriggerHandler.updateconPhone(Trigger.new, Trigger.oldMap);
}
}
if(Trigger.isDelete){
if(Trigger.isBefore){
AccountTriggerHandler.avoidDeletionIfIndustryIsBanking(Trigger.Old);
}
else if(Trigger.isAfter){
    
}
}
}