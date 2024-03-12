trigger Workout on Workout__c (before insert, before update, before delete, after insert, after update,after delete) {
    TriggerFactory.createHandler(Workout__c.sObjectType);
}