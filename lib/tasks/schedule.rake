desc "Run the schedule"
task :schedule => :environment do
  GenerateWeeklyScheduleJob.new.perform_now
end
