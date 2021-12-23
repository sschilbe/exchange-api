# README

## Start Application
- To seed the initial exchange values run `rails db:seed`
- Run `rails s` to start the rails server on default port (3000)

## Update stored exchange values
### Manually
`rails db:seed` will run `PopulateExchangesJob` to upsert the currently stored exchange values.

### Automated
Using the [Whenever](https://github.com/javan/whenever) gem we can add a cron job that will execute the `PopulateExchangesJob` to upsert the stored exchange values. Currently, the configuration will run the job at 12:00AM every night, a future improvement would be to leverage the `time_next_update_unix` timestamp from the [exchangerate-api](https://open.exchangerate-api.com/v6/latest) to execute the job after the data has been updated.

The crontab installation can be performed by executing:
`whenever --update-crontab`
