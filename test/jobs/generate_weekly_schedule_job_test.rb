require "test_helper"

class GenerateWeeklyScheduleJobTest < ActiveJob::TestCase
  test "should generate a weekly schedule" do
    assert_enqueued_with(job: GenerateWeeklyScheduleJob) do
      GenerateWeeklyScheduleJob.perform_later
    end
  end

  # TODO: there should be more tests here for sure
  test "should generate a string with all the days and who's working on what buildings" do
    buildings(:one)
    buildings(:two)
    employees(:one)
    employees(:two)
    employee_ptos(:one)
    employee_ptos(:two)

    assert_equal "{:monday=>[{:building=>298486374, :crew=>[1, 3]}], :tuesday=>[{:building=>980190962, :crew=>[1, 3]}], :wednesday=>[], :thursday=>[], :friday=>[]}", GenerateWeeklyScheduleJob.perform_now
  end
end

