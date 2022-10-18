require "test_helper"

class EmployeeTest < ActiveSupport::TestCase
  test "should have a default employee type of laborer" do
    employee = Employee.new
    assert_equal "laborer", employee.employee_type
  end

  test "available scope should return employees with no pto for today" do
    employee = employees(:one)
    assert_includes Employee.available, employee
  end

  test "available scope should return employees with no pto for yesterday when given yesterdays date" do
    employee = employees(:two)
    assert_includes Employee.available(Date.yesterday), employee
  end
end
