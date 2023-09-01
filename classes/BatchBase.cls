public abstract class BatchBase implements Database.Batchable<Object>, Database.AllowsCallouts, schedulable {
    private String name { get; private set; }
    public String cronExpression { get; private set; }
    public Integer scobeSize { get; private set; }
    public String scheduleName {
      get {
        if (String.isBlank(this.name))
          return null;
  
        return (Test.isRunningTest() ? 'Test_' : '') + this.name;
      }
      private set;
    }
  
    public BatchBase() {
      this.name = 'Unamed process';
    }
  
    public BatchBase(String name) {
      this.name = name;
    }
  
    public BatchBase(String name, String cronExpression) {
      this.name = name;
      this.cronExpression = cronExpression;
      this.scobeSize = 200;
    }
  
    public BatchBase(String name, String cronExpression, Integer scobeSize) {
      this.name = name;
      this.cronExpression = cronExpression;
      this.scobeSize = scobeSize;
    }
  
    // * Agendador
    public void execute(SchedulableContext SC) {
      Database.executeBatch(this, this.scobeSize);
    }
  
    public void scheduleJob() {
      if (this.scheduleName != null && this.cronExpression != null) {
        this.abortJob();
  
        String logTemplate = 'Criado agendamento "{0} / CRON utilizada "{1}"';
  
        System.schedule(this.scheduleName, this.cronExpression, this);
  
        System.debug(String.format(logTemplate, new List<String>{ this.scheduleName, this.cronExpression }));
      }
    }
  
    public void abortJob() {
      if (this.scheduleName != null) {
        List<AsyncApexJob> lstJob = [SELECT Id, CronTriggerId FROM AsyncApexJob WHERE CronTrigger.CronJobDetail.name = :this.scheduleName];
  
        if (lstJob.isEmpty())
          return;
  
        Id jobId = lstJob[0].CronTriggerId;
        System.abortJob(jobId);
        System.debug('Aborted apex job ' + this.scheduleName + ' , ' + jobId);
      }
    }
  
    public void setScopeSize(Integer size) {
      if (size != null && size > 0) {
        this.scobeSize = size;
      }
    }
  
    public CronTrigger getJobInfo() {
      CronTrigger response;
      if (this.scheduleName != null) {
        try {
          response = [
            SELECT
              Id,
              CronJobDetailId,
              NextFireTime,
              PreviousFireTime,
              State,
              EndTime,
              OwnerId,
              LastModifiedById,
              LastModifiedBy.name,
              CreatedById,
              CreatedBy.name,
              CreatedDate,
              TimesTriggered,
              CronJobDetail.Name,
              CronJobDetail.Id
            FROM CronTrigger
            WHERE CronTrigger.CronJobDetail.name = :this.scheduleName
          ];
        } catch (Exception e) {
        }
      }
      return response;
    }
  }
  