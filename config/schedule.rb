# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

require 'logger'

log_file = File.expand_path('../../log/cron.log', __FILE__)
logger = Logger.new(log_file, 'daily')

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

# every 15.minutes do
#     runner "ParkVisit.notify_owners"
# end

# every 1.minute do
#     rake "ParkVisit.test_notify_owners"
#     logger.info "test_notify_owners has run at #{Time.now}"
# end

# Learn more: http://github.com/javan/whenever
