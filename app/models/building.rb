class Building < ApplicationRecord
  enum building_type: {
    single_story_home: 0,
    two_story_home: 1,
    commercial: 2,
  }

  validates :building_type, presence: true

  def crew_makeup
    case building_type
    when "single_story_home"
      {
        required: {
          certified_installer: 1
        },
        pool: {total: 0, types: []}
      }
    when "two_story_home"
      {
        required: {
          certified_installer: 1
        },
        pool: {
          total: 1,
          types: [:installer_pending_certification, :laborer]
        }
      }
    when "commercial"
      {
        required: {
          certified_installer: 2,
          installer_pending_certification: 2
        },
        pool: {
          total: 4,
          types: [
            :certified_installer,
            :installer_pending_certification,
            :laborer
          ]
        }
      }
    end
  end
end
