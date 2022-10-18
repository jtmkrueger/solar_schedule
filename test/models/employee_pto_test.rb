require "test_helper"

class EmployeePtoTest < ActiveSupport::TestCase
  test "should have a default pto type of sick" do
    employee_pto = EmployeePto.new
    assert_equal "sick", employee_pto.pto_type
  end
end
