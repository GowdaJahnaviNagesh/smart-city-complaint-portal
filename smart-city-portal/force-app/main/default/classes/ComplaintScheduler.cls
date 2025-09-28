global class ComplaintScheduler implements Schedulable {
    global void execute(SchedulableContext sc) {
        System.enqueueJob(new UrgentComplaintQueueable());
    }
}
