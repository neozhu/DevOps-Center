/**
 * @description This class uses the TriggerHandler class to handle the logic of bulk updates and
 * passing trigger events to handler methods.
 *
 */
public with sharing class WorkoutHandler implements ITrigger {
  public WorkoutHandler() {
  }
  private Map<string, Workout__c> changed = new Map<string, Workout__c>();
  /**
   * bulkBefore
   *
   * This method is called prior to execution of a BEFORE trigger. Use this to cache
   * any data required into maps prior execution of the trigger.
   */
  public void bulkBefore() {
    system.debug('WorkoutHandler -> bulkBefore:');
  }

  /**
   * bulkAfter
   *
   * This method is called prior to execution of an AFTER trigger. Use this to cache
   * any data required into maps prior execution of the trigger.
   */
  public void bulkAfter() {
    system.debug('WorkoutHandler -> bulkAfter:');
  }

  /**
   * beforeInsert
   *
   * This method is called iteratively for each record to be inserted during a BEFORE
   * trigger. Never execute any SOQL/SOSL etc in this and other iterative methods.
   */
  public void beforeInsert(SObject so) {
    system.debug('WorkoutHandler -> beforeInsert: ' + so.Id);
  }

  /**
   * beforeUpdate
   *
   * This method is called iteratively for each record to be updated during a BEFORE
   * trigger.
   */
  public void beforeUpdate(SObject oldSo, SObject so) {
    system.debug('WorkoutHandler -> beforeUpdate: ' + oldSo.Id + ' : ');
  }

  /**
   * beforeDelete
   *
   * This method is called iteratively for each record to be deleted during a BEFORE
   * trigger.
   */
  public void beforeDelete(SObject so) {
    system.debug('WorkoutHandler -> beforeDelete: ' + so.Id + ' : ');
  }

  /**
   * afterInsert
   *
   * This method is called iteratively for each record inserted during an AFTER
   * trigger. Always put field validation in the 'After' methods in case another trigger
   * has modified any values. The record is 'read only' by this point.
   */
  public void afterInsert(SObject so) {
    changed.put(so.Id, (Workout__c) so);
    system.debug('WorkoutHandler -> afterInsert: ' + so.Id + ' : ');
  }

  /**
   * afterUpdate
   *
   * This method is called iteratively for each record updated during an AFTER
   * trigger.
   */
  public void afterUpdate(SObject oldSo, SObject so) {
    changed.put(so.Id, (Workout__c) so);
    system.debug('WorkoutHandler -> afterUpdate: ' + so.Id + ' : ');
  }

  /**
   * afterDelete
   *
   * This method is called iteratively for each record deleted during an AFTER
   * trigger.
   */
  public void afterDelete(SObject so) {
    changed.put(so.Id, (Workout__c) so);
    system.debug('WorkoutHandler -> afterDelete: ' + so.Id + ' : ');
  }

  /**
   * andFinally
   *
   * This method is called once all records have been processed by the trigger. Use this
   * method to accomplish any final operations such as creation or updates of other records.
   */
  public void andFinally() {
    for (String k : changed.keySet()) {
      system.debug('WorkoutHandler -> andFinally: ' + k + ' : ');
    }
  }
}
