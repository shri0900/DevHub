trigger AccountTrigger on Account (before insert) {

if(Trigger.IsInsert){
if(Trigger.isBefore){
    AccountTriggerHandler.updateRating(Trigger.new);
}
else if(Trigger.isAfter){
    AccountTriggerHandler.createRelatedCons(Trigger.new);
}
}

}