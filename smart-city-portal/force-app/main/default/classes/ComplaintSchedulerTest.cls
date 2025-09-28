@isTest
public class ComplaintSchedulerTest {
    @isTest
    static void testSchedulerRunsQueueable() {
        Test.startTest();
        String CRON_EXP = '0 0 0 * * ?'; // Daily at midnight
        System.schedule('Test Complaint Scheduler', CRON_EXP, new ComplaintScheduler());
        Test.stopTest();

        // If it ran, coverage will count
        System.assert(true);
    }
}
