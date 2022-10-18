require "test_helper"

class GenerateWeeklyScheduleJobTest < ActiveJob::TestCase
  test "should generate a weekly schedule" do
    assert_enqueued_with(job: GenerateWeeklyScheduleJob) do
      GenerateWeeklyScheduleJob.perform_later
    end
  end
end
