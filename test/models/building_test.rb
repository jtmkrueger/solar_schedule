require "test_helper"

class BuildingTest < ActiveSupport::TestCase
  test "should have a default building type of single_story_home" do
    building = Building.new
    assert_equal "single_story_home", building.building_type
  end

  test "crew_makeup should return the correct crew makeup for a single story home" do
    building = Building.new(building_type: "single_story_home")
    assert_equal({
      required: {
        certified_installer: 1
      },
      pool: {}
    }, building.crew_makeup)
  end

  test "crew_makeup should return the correct crew makeup for a two story home" do
    building = Building.new(building_type: "two_story_home")
    assert_equal({
      required: {
        certified_installer: 1
      },
      pool: {
        installer_pending_certification: 1,
        laborer: 1
      }
    }, building.crew_makeup)
  end

  test "crew_makeup should return the correct crew makeup for a commercial building" do
    building = Building.new(building_type: "commercial")
    assert_equal({
      required: {
        certified_installer: 2,
        installer_pending_certification: 2
      },
      pool: {
        certified_installer: 4,
        installer_pending_certification: 4,
        laborer: 4
      }
    }, building.crew_makeup)
  end
end
