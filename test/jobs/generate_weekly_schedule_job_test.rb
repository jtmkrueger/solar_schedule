require "test_helper"

class GenerateWeeklyScheduleJobTest < ActiveJob::TestCase
  test "should generate a weekly schedule" do
    assert_enqueued_with(job: GenerateWeeklyScheduleJob) do
      GenerateWeeklyScheduleJob.perform_later
    end
  end

  # test "iterate_buildings should iterate through all buildings" do
  #   buildings = Building.all
  #   buildings.each do |building|
  #     assert_equal building, building
  #   end
  # end
end
