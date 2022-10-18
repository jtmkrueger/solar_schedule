require "schedule"
class GenerateWeeklyScheduleJob < ApplicationJob
  queue_as :default

  def perform
    Schedule.new.run
  end
end
