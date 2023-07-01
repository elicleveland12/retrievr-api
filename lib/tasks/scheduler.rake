desc "This task is called by the Heroku scheduler add-on"
task :test_notify_owners => :environment do
    puts "test_notify_owners"
    ParkVisit.test_notify_owners
    puts "done."
end

task :notify_owners => :environment do
    puts "notify_owners"
    ParkVisit.notify_owners
    puts "done."
end