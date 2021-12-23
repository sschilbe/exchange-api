# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

# Run populate exchange job every 24 hours
# TODO: Leverage the 'time_next_update_unix' provided by the exchange API to refresh the data as soon as it is updated by exchangerate-api
every 1.day, at: '12:00 am' do
    runner "PopulateExchangesJob.perform"
end
