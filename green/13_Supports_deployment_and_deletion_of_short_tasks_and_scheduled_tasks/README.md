# CLI Way

## Cron jobs
Create a cronjob that will execute every two minutes:
![create cronjob](img/create_cronjob.png)

After two minutes, the cron job will run for the first time\
![cronjob first run](img/cronjob_first_run.png)

After some more time, the job will run the expected amount of times
![cronjobs nth run](img/cronjobs_nth_run.png)
![cronjobs nth run logs](img/cronjobs_nth_run_logs.png)

## One-shot jobs

Create a job definition that will spawn 5 pods, 2 at a time:\
![create job](img/job_create.png)

after a while, the pods will be spawned and complete their task\
![job run](img/job_run.png)
